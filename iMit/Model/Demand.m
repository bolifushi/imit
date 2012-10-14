//■ ■ ■
//■ Demand.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Demand.h"

@implementation Demand

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
- (id)initWithName:(NSString *)name
              code:(NSString *)code
            status:(NSString *)status
      customerName:(NSString *)customerName
      employeeName:(NSString *)employeeName
       custempName:(NSString *)custempName
       amountMoney:(NSString *)amountMoney
       closingDate:(NSDate *)closingDate;
{
    self = [super init];
    if (self)
    {
        _name = name;
        _code = code;
        _status = status;

        _customerName = customerName;
        _employeeName = employeeName;
        _custempName = custempName;
        _amountMoney = amountMoney;
        
        _closingDate = closingDate;
        
        return self;
    }
    return nil;
}
@end
