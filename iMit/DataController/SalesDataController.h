//■ ■ ■
//■ SalesDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Sales ]クラスの先方宣言
@class Sales;
@class MituSocket;

//デリゲートプロトコル宣言
@protocol SalesDataControllerDelegate;

@interface SalesDataController : NSObject
{
    MituSocket* mituSocket;
    dispatch_queue_t queue;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (weak, nonatomic) id <SalesDataControllerDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *masterSalesList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (void)GetSales;

- (id)initWithSocket:(MituSocket *)mituSocket
               queue:(dispatch_queue_t)queue;
- (unsigned)countOfList;
- (Sales *)objectInListAtIndex:(unsigned)theIndex;
- (void)addPaymentWithName:(NSString *)inputName
                      code:(NSString *)inputCode
               amountMoney:(NSString *)inputAmountMoney;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol SalesDataControllerDelegate <NSObject>
- (void)SalesDataControllerDidReceive:(SalesDataController *)controller;

@end
