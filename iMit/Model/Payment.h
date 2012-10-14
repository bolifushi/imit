//■ ■ ■
//■ Payment.h
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import <Foundation/Foundation.h>

@interface Payment : NSObject

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSString *name;         //JOB名
@property (nonatomic, copy) NSString *code;         //見積もり番号
@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *customerName; //取引先
@property (nonatomic, copy) NSString *employeeName; //社内担当
@property (nonatomic, copy) NSString *amountMoney;  //金額
@property (nonatomic, strong) NSDate *receiveDate;  //締日

//--------------------------------------------------------------//
#pragma mark -- [ Instance Method ] --
//--------------------------------------------------------------//

//■　カスタムイニシャライザメソッド
-(id)initWithName:(NSString *)name
             code:(NSString *)code
           status:(NSString *)status
     customerName:(NSString *)customerName
     employeeName:(NSString *)employeeName
      amountMoney:(NSString *)amountMoney
      receiveDate:(NSDate *)receiveDate;
@end
