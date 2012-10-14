//■ ■ ■
//■ SectionDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Section ]クラスの先方宣言
@class Section;
@class MituSocket;

@interface SectionDataController : NSObject
{
    MituSocket* mituSocket;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSMutableArray *masterSectionList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (id)initWithSocket:(MituSocket *)mituSocket;
- (unsigned)countOfList;
- (Section *)objectInListAtIndex:(unsigned)theIndex;
- (void)addSectionWithName:(NSString *)inputSectionName
                   code:(NSString *)inputCode;

@end
