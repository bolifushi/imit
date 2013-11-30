//■ ■ ■
//■ LogDataController.h
//■ モデルレイヤ - データコントローラ
//■ ■
#import <Foundation/Foundation.h>

//[ Log ]クラスの先方宣言
@class Log;
@class MituSocket;

//デリゲートプロトコル宣言
@protocol LogDataControllerDelegate;

@interface LogDataController : NSObject
{
    MituSocket* mituSocket;
    dispatch_queue_t queue;
}

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (weak, nonatomic) id <LogDataControllerDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *masterLogList;
//※ 代入にオブジェクトのコピーを使用する

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

- (void)GetLog;

- (id)initWithSocket:(MituSocket *)mituSocket
               queue:(dispatch_queue_t)queue;
- (unsigned)countOfList;
- (Log *)objectInListAtIndex:(unsigned)theIndex;
- (void)addPaymentWithName:(NSString *)inputName
                      code:(NSString *)inputCode
                      date:(NSString *)inputDate
                   message:(NSString *)inputMessage
                      data:(NSString *)inputData;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol LogDataControllerDelegate <NSObject>
- (void)LogDataControllerDidReceive:(LogDataController *)controller;

@end
