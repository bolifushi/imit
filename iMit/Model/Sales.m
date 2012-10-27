//■ ■ ■
//■ Sales.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Sales.h"

@implementation Sales

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
- (id)initWithName:(NSString *)name
              code:(NSString *)code
       amountMoney:(NSString *)amountMoney
        percentage:(NSString *)percentage;
{
    self = [super init];
    if (self)
    {
        _name = name;
        _code = code;
        _amountMoney = amountMoney;
        _percentage = percentage;
        
        return self;
    }
    return nil;
}
@end
