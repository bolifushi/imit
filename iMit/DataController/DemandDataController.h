//■ ■ ■
//■ DemandDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Demand ]クラスの先方宣言
@class Demand;
@class MituSocket;

//デリゲートプロトコル宣言
@protocol DemandDataControllerDelegate;

@interface DemandDataController : NSObject
{
    MituSocket* mituSocket;
    dispatch_queue_t queue;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (weak, nonatomic) id <DemandDataControllerDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *masterDemandList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (void)GetDemand;

- (id)initWithSocket:(MituSocket *)mituSocket
               queue:(dispatch_queue_t)queue;
- (unsigned)countOfList;
- (Demand *)objectInListAtIndex:(unsigned)theIndex;
- (void)addDemandWithName:(NSString *)inputName
                     code:(NSString *)inputCode
                   status:(NSString *)inputStatus
             customerName:(NSString *)inputCustomerName
             employeeName:(NSString *)inputEmployeeName
              custempName:(NSString *)inputCustempName
              amountMoney:(NSString *)inputAmountMoney
              closingDate:(NSDate *)inputClosingDate;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol DemandDataControllerDelegate <NSObject>
- (void)DemandDataControllerDidReceive:(DemandDataController *)controller;

@end
