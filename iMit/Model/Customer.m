//■ ■ ■
//■ Customer.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Customer.h"

@implementation Customer

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
- (id)initWithName:(NSString *)name
          code:(NSString *)code
              date:(NSDate *)date
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
