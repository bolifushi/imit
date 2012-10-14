//■ ■ ■
//■ SectionDataController.m
//■ モデルレイヤ - データコントローラ
//■ ■
#import "SectionDataController.h"
#import "Section.h"
#import "MituSocket.h"

//クラス拡張：このクラスにプライベートなメソッドを宣言
@interface SectionDataController ()
- (void)initializeDefaultDataList;
@end

@implementation SectionDataController

//--------------------------------------------------------------//
#pragma mark -- [ Custom Property ] --
//--------------------------------------------------------------//

//■ マスタリストプロパティ用のカスタムsetter
- (void)setMasterSectionList:(NSMutableArray *)newList {
    if (_masterSectionList != newList) {
        _masterSectionList = [newList mutableCopy];
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Class extended method ] --
//--------------------------------------------------------------//

//■ リスト作成メソッド
- (void)initializeDefaultDataList
{
    //■ 新しい可変配列を[ masterSectionList ]変数に割り当て
    NSMutableArray *SectionList = [[NSMutableArray alloc] init];
    self.masterSectionList = SectionList;
    
    //■ データを取得し[ addSectionWithName:code ]メソッドに渡し、
    //  このメソッドが新しい[ Section ]オブジェクトを作成してマルタリストに追加
    NSString* data;
    
    //客先マスタの取得
    [mituSocket GetData:&data withCommand:@"MAIN_02005\t\r\n"];
	NSArray *custs = [data componentsSeparatedByString:@"\t"];
	
    // 表示する
    for(int i = 0; i<[custs count]; i++){
        NSArray *items = [custs[i] componentsSeparatedByString:@" "];
        
        if([items count] >= 2)
        {
            [self addSectionWithName:items[1] code:items[0]];
        }
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

//■ 集合内の[ Section ]オブジェクトの数を返す
- (unsigned)countOfList
{
    return [self.masterSectionList count];
}

//■ [ Section ]オブジェクトを集合内意の特定位置に返す
- (Section *)objectInListAtIndex:(unsigned)theIndex
{
    return [self.masterSectionList objectAtIndex:theIndex];
}

//■ ユーザからの入力を使用して新しい[ Section ]オブジェクトを作成し、集合に追加
- (void)addSectionWithName:(NSString *)inputSectionName
                   code:(NSString *)inputCode
{
    Section *section;
    NSDate *today = [NSDate date];

    section = [[Section alloc] initWithName:inputSectionName
                                       code:inputCode
                                       date:today];
    
    [self.masterSectionList addObject:section];
}

@end

