//■ ■ ■
//■ Payment.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Payment.h"

@implementation Payment

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
- (id)initWithName:(NSString *)name
              code:(NSString *)code
            status:(NSString *)status
      customerName:(NSString *)customerName
      employeeName:(NSString *)employeeName
       amountMoney:(NSString *)amountMoney
       receiveDate:(NSDate *)receiveDate;
{
    self = [super init];
    if (self)
    {
        _name = name;
        _code = code;
        _status = status;
        
        _customerName = customerName;
        _employeeName = employeeName;
        _amountMoney = amountMoney;
        
        _receiveDate = receiveDate;
        
        return self;
    }
    return nil;
}
@end
