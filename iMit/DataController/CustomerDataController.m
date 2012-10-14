//■ ■ ■
//■ CustomerDataController.m
//■ モデルレイヤ - データコントローラ
//■ ■
#import "CustomerDataController.h"
#import "Customer.h"
#import "MituSocket.h"

//クラス拡張：このクラスにプライベートなメソッドを宣言
@interface CustomerDataController ()
- (void)initializeDefaultDataList;
@end

@implementation CustomerDataController

//--------------------------------------------------------------//
#pragma mark -- [ Custom Property ] --
//--------------------------------------------------------------//

//■ マスタリストプロパティ用のカスタムsetter
- (void)setMasterCustomerList:(NSMutableArray *)newList {
    if (_masterCustomerList != newList) {
        _masterCustomerList = [newList mutableCopy];
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Class extended method ] --
//--------------------------------------------------------------//

//■ リスト作成メソッド
- (void)initializeDefaultDataList
{
    //■ 新しい可変配列を[ masterCustomerList ]変数に割り当て
    NSMutableArray *customerList = [[NSMutableArray alloc] init];
    self.masterCustomerList = customerList;
    
    //■ データを取得し[ addCustomerWithName:code ]メソッドに渡し、
    //  このメソッドが新しい[ Customer ]オブジェクトを作成してマルタリストに追加
    NSString* data;
    
    //客先マスタの取得
    [mituSocket GetData:&data withCommand:@"MAIN_01\r\n"];
	NSArray *custs = [data componentsSeparatedByString:@"\t"];
	
    // 表示する
    for(int i = 0; i<[custs count]; i++){
        NSArray *items = [custs[i] componentsSeparatedByString:@" "];
        
        if([items count] >= 2)
        {
            [self addCustomerWithName:items[1] code:items[0]];
        }
        //if (i>48) break;
    }
//    [msocket Disconnect];
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

//■ Socket付き初期化
-(id)initWithSocket:(MituSocket *)p_mituSocket
{
    mituSocket = p_mituSocket;
    return [self init];
}

//■ 集合内の[ Customer ]オブジェクトの数を返す
- (unsigned)countOfList
{
    return [self.masterCustomerList count];
}

//■ [ Customer ]オブジェクトを集合内意の特定位置に返す
- (Customer *)objectInListAtIndex:(unsigned)theIndex
{
    return [self.masterCustomerList objectAtIndex:theIndex];
}

//■ ユーザからの入力を使用して新しい[ Customer ]オブジェクトを作成し、集合に追加
- (void)addCustomerWithName:(NSString *)inputCustomerName
                   code:(NSString *)inputCode
{
    Customer *customer;
    NSDate *today = [NSDate date];

    customer = [[Customer alloc] initWithName:inputCustomerName
                                     code:inputCode date:today];
    [self.masterCustomerList addObject:customer];
}

@end

