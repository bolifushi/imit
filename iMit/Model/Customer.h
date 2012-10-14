//■ ■ ■
//■ Customer.h
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import <Foundation/Foundation.h>

@interface Customer : NSObject

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong) NSDate *date;

//--------------------------------------------------------------//
#pragma mark -- [ Instance Method ] --
//--------------------------------------------------------------//

//■　カスタムイニシャライザメソッド
-(id)initWithName:(NSString *)name
         code:(NSString *)code
             date:(NSDate *)date;

@end
