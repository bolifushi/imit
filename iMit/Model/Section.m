//■ ■ ■
//■ Section.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Section.h"

@implementation Section

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
//- (id)initWithName:(NSString *)name
//              Code:(NSString *)code
//              Date:(NSDate *)date
//       ClosingDate:(NSDate *)closingDate
//       PaymentDate:(NSDate *)paymentDate
//          ShipCode:(NSString *)shipCode;
//{
//    self = [super init];
//    if (self)
//    {
//        _name = name;
//        _code = code;
//        _date = date;
//        _closingDate = closingDate;
//        _paymentDate = paymentDate;
//        _shipCode = shipCode;
//
//        return self;
//    }
//    return nil;
//}

- (id)initWithName:(NSString *)name
              code:(NSString *)code
              date:(NSDate *)date;
 {
    self = [super init];
    if (self)
    {
        _name = name;
        _code = code;
        _date = date;
        
        return self;
    }
    return nil;
}
@end
