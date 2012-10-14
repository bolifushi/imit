//■ ■ ■
//■ CustomerDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Customer ]クラスの先方宣言
@class Customer;
@class MituSocket;

@interface CustomerDataController : NSObject
{
    MituSocket* mituSocket;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSMutableArray *masterCustomerList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (id)initWithSocket:(MituSocket *)mituSocket;
- (unsigned)countOfList;
- (Customer *)objectInListAtIndex:(unsigned)theIndex;
- (void)addCustomerWithName:(NSString *)inputCustomerName
                   code:(NSString *)inputCode;

@end
