//■ ■ ■
//■ Estimate.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Estimate.h"

@implementation Estimate

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
          makeDate:(NSDate *)makeDate
      deliveryDate:(NSDate *)deliveryDate;
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

        _makeDate = makeDate;
        _deliveryDate = deliveryDate;

        return self;
    }
    return nil;
}

@end
