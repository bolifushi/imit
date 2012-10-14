//■ ■ ■
//■ EstimateDataController.m
//■ モデルレイヤ - データコントローラ
//■ ■
#import "EstimateDataController.h"
#import "Estimate.h"
#import "MituSocket.h"

//クラス拡張：このクラスにプライベートなメソッドを宣言
@interface EstimateDataController ()
- (void)initializeDefaultDataList;
@end

@implementation EstimateDataController

//--------------------------------------------------------------//
#pragma mark -- [ Custom Property ] --
//--------------------------------------------------------------//

//■ マスタリストプロパティ用のカスタムsetter
- (void)setMasterEstimateList:(NSMutableArray *)newList {
    if (_masterEstimateList != newList) {
        _masterEstimateList = [newList mutableCopy];
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Class extended method ] --
//--------------------------------------------------------------//
//Estimate取得
- (void)GetEstimate
{
    //■ データを取得し[ addEstimateWithName:code ]メソッドに渡し、
    //  このメソッドが新しい[ Estimate ]オブジェクトを作成してマルタリストに追加
    
    //標準ディスパッチ・キューの取得
    //dispatch_queue_t queue = dispatch_get_global_queue(
    //                            DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //グループの作成
    //dispatch_group_t group = dispatch_group_create();
    
    //シリアルキューの作成
    //dispatch_queue_t queue = dispatch_queue_create(
    //                    "net.bolifushi.toyomaint.serial_queue", NULL);
    @try
    {
        //処理を追加する
        dispatch_async(queue, ^{
        //dispatch_group_async(group, queue, ^{
            
            NSString* data;
            
            //見積もり情報の取得
            [mituSocket GetData:&data withCommand:@"MITU_110\t1999\t0\t10\t1\t103\t01\t0\t0\t\r\n"];
            
            if ([data hasPrefix:(@"#Error#")]) {
                dbgLog(@"data:%@", data);
                return;
            }
            
            static NSDateFormatter *formatter = nil;
            if (formatter == nil) {
                formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"YY/MM/DD"];
            }
            
            do {
                [mituSocket GetData:&data withCommand:@"MINT_110\t1999\t0\t10\t1\t103\t01\t0\t0\t\r\n"];
                
                if ([data hasPrefix:@"EOF"]) break;
                
                if ([data hasPrefix:(@"#Error#")]) {
                    dbgLog(@"data:%@", data);
                    return;
                }
                NSArray *estArray = [data componentsSeparatedByString:@"\t"];
                if([estArray count] >= 10)
                {
                    [self addEstimateWithName:estArray[2]
                                         code:estArray[0]
                                       status:estArray[9]
                                 customerName:estArray[1]
                                 employeeName:estArray[3]
                                  amountMoney:estArray[6]
                                     makeDate:[formatter dateFromString:estArray[4]]
                                 deliveryDate:[formatter dateFromString:estArray[5]]];

                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[self delegate] EstimateDataControllerDidReceive:self];
                    });
                }
            } while (TRUE);
        });
    }
    @catch(NSException *exception)
    {
        dbgLog( @"neme[ %@ ] reason[ %@ ]", [exception name], [exception reason]);
    }
    //処理の待ち合わせ
    //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

    //グループの解放
    //dispatch_release(group);
}

//■ リスト作成メソッド
- (void)initializeDefaultDataList
{
    //■ 新しい可変配列を[ masterEstimateList ]変数に割り当て
    NSMutableArray *EstimateList = [[NSMutableArray alloc] init];
    self.masterEstimateList = EstimateList;
    
}

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■ [ DataController ]オブジェクトを初期化
- (id)init
{
    //■ [ self ]に、スーパークラスのイニシャライザから返された値を割り当て
    if (self = [super init])
    {
        
        [self initializeDefaultDataList];
    }
    return self;
}

//■ Socket, Queue付き初期化
-(id)initWithSocket:(MituSocket *)p_mituSocket
              queue:(dispatch_queue_t)p_queue
{
    mituSocket = p_mituSocket;
    queue = p_queue;
    return [self init];
}

//■ 集合内の[ Estimate ]オブジェクトの数を返す
- (unsigned)countOfList
{
    return [self.masterEstimateList count];
}

//■ [ Estimate ]オブジェクトを集合内意の特定位置に返す
- (Estimate *)objectInListAtIndex:(unsigned)theIndex
{
    return [self.masterEstimateList objectAtIndex:theIndex];
}

//■ ユーザからの入力を使用して新しい[ Estimate ]オブジェクトを作成し、集合に追加
- (void)addEstimateWithName:(NSString *)inputName
                       code:(NSString *)inputCode
                     status:(NSString *)inputStatus
               customerName:(NSString *)inputCustomerName
               employeeName:(NSString *)inputEmployeeName
                amountMoney:(NSString *)inputAmountMoney
                   makeDate:(NSDate *)inputMakeDate
               deliveryDate:(NSDate *)inputDeliveryDate
{
    Estimate *estimate;
    
    estimate = [[Estimate alloc] initWithName:inputName
                                         code:inputCode
                                       status:inputStatus
                                 customerName:inputCustomerName
                                 employeeName:inputEmployeeName
                                  amountMoney:inputAmountMoney
                                     makeDate:inputMakeDate
                                 deliveryDate:inputDeliveryDate];
    

    [self.masterEstimateList addObject:estimate];
}

@end

