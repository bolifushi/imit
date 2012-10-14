//■ ■ ■
//■ EstimateDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Estimate ]クラスの先方宣言
@class Estimate;
@class MituSocket;

//デリゲートプロトコル宣言
@protocol EstimateDataControllerDelegate;

@interface EstimateDataController : NSObject
{
    MituSocket* mituSocket;
    dispatch_queue_t queue;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (weak, nonatomic) id <EstimateDataControllerDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *masterEstimateList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (void)GetEstimate;

- (id)initWithSocket:(MituSocket *)mituSocket
               queue:(dispatch_queue_t)queue;
- (unsigned)countOfList;
- (Estimate *)objectInListAtIndex:(unsigned)theIndex;
- (void)addEstimateWithName:(NSString *)inputEstimateName
                       code:(NSString *)inputCode
                     status:(NSString *)inputStatus
               customerName:(NSString *)inputCustomerName
               employeeName:(NSString *)inputEmployeeName
                amountMoney:(NSString *)inputAmountMoney
                   makeDate:(NSDate *)inputMakeDate
               deliveryDate:(NSDate *)inputDeliveryDate;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol EstimateDataControllerDelegate <NSObject>
- (void)EstimateDataControllerDidReceive:(EstimateDataController *)controller;

@end
