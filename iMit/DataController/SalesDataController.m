//■ ■ ■
//■ SalesDataController.m
//■ モデルレイヤ - データコントローラ
//■ ■
#import "SalesDataController.h"
#import "Sales.h"
#import "MituSocket.h"

//クラス拡張：このクラスにプライベートなメソッドを宣言
@interface SalesDataController ()
- (void)initializeDefaultDataList;
@end

@implementation SalesDataController

//--------------------------------------------------------------//
#pragma mark -- [ Custom Property ] --
//--------------------------------------------------------------//

//■ マスタリストプロパティ用のカスタムsetter
- (void)setMasterSalesList:(NSMutableArray *)newList {
    if (_masterSalesList != newList) {
        _masterSalesList = [newList mutableCopy];
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Class extended method ] --
//--------------------------------------------------------------//
//Payment取得
- (void)GetSales
{
    
    //■ データを取得し[ addEstimateWithName:code ]メソッドに渡し、
    //  このメソッドが新しい[ Estimate ]オブジェクトを作成してマルタリストに追加

    
    //標準ディスパッチ・キューの取得
    //dispatch_queue_t queue = dispatch_get_global_queue(
    //                            DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //グループの作成
    //dispatch_group_t group = dispatch_group_create();
    
    @try
    {
        //処理を追加する
        dispatch_async(queue, ^{
        //dispatch_group_async(group, queue, ^{
            
            NSString* data;
    
            //見積もり情報の取得
            [mituSocket GetData:&data withCommand:@"MITU_8120120401\t20120331\t\r\n"];
            
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
                [mituSocket GetData:&data withCommand:@"MINT_8120120401\t20120331\t\r\n"];
                
                if ([data hasPrefix:@"EOF"]) break;
                
                if ([data hasPrefix:(@"#Error#")]) {
                    dbgLog(@"data:%@", data);
                    return;
                }
                
                NSArray *estArray = [data componentsSeparatedByString:@"\t"];
                if([estArray count] >= 2)
                {
                    [self addSalesWithName:estArray[1]
                                        code:estArray[0]
                                 amountMoney:estArray[2]];

                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[self delegate] SalesDataControllerDidReceive:self];
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
    NSMutableArray *SalesList = [[NSMutableArray alloc] init];
    self.masterSalesList = SalesList;
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

//■ 集合内の[ Payment ]オブジェクトの数を返す
- (unsigned)countOfList
{
    return [self.masterSalesList count];
}

//■ [ Payment ]オブジェクトを集合内意の特定位置に返す
- (Sales *)objectInListAtIndex:(unsigned)theIndex
{
    return [self.masterSalesList objectAtIndex:theIndex];
}

//■ ユーザからの入力を使用して新しい[ Payment ]オブジェクトを作成し、集合に追加
- (void)addSalesWithName:(NSString *)inputName
                      code:(NSString *)inputCode
               amountMoney:(NSString *)inputAmountMoney
{
    Sales *sales;

    sales = [[Sales alloc] initWithName:inputName
                                       code:inputCode
                                amountMoney:inputAmountMoney];
    
    [self.masterSalesList addObject:sales];
}

@end

