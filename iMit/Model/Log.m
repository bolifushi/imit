//■ ■ ■
//■ Log.m
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import "Log.h"

@implementation Log

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//

//■　カスタマイズイニシャライザメソッド
- (id)initWithName:(NSString *)name
              code:(NSString *)code
              date:(NSString *)date
           message:(NSString *)message
              data:(NSString *)data;
{
    self = [super init];
    if (self)
    {
        _name = name;
        _code = code;
        _date = date;
        _message = message;
        _data = data;
        
        return self;
    }
    return nil;
}
@end
