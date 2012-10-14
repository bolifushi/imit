//■ ■ ■
//■ PaymentDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Payment ]クラスの先方宣言
@class Payment;
@class MituSocket;

//デリゲートプロトコル宣言
@protocol PaymentDataControllerDelegate;

@interface PaymentDataController : NSObject
{
    MituSocket* mituSocket;
    dispatch_queue_t queue;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (weak, nonatomic) id <PaymentDataControllerDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *masterPaymentList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (void)GetPayment;

- (id)initWithSocket:(MituSocket *)mituSocket
               queue:(dispatch_queue_t)queue;
- (unsigned)countOfList;
- (Payment *)objectInListAtIndex:(unsigned)theIndex;
- (void)addPaymentWithName:(NSString *)inputName
                      code:(NSString *)inputCode
                    status:(NSString *)inputStatus
              customerName:(NSString *)inputCustomerName
              employeeName:(NSString *)inputEmployeeName
               amountMoney:(NSString *)inputAmountMoney
               receiveDate:(NSDate *)inputReceiveDate;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol PaymentDataControllerDelegate <NSObject>
- (void)PaymentDataControllerDidReceive:(PaymentDataController *)controller;

@end
