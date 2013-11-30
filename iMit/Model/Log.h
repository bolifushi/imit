//■ ■ ■
//■ Log.h
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import <Foundation/Foundation.h>

@interface Log : NSObject

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *date;  //金額
@property (nonatomic,copy) NSString *message;    //比率
@property (nonatomic,copy) NSString *data;    //比率
//--------------------------------------------------------------//
#pragma mark -- [ Instance Method ] --
//--------------------------------------------------------------//

//■　カスタムイニシャライザメソッド
-(id)initWithName:(NSString *)name
             code:(NSString *)code
             date:(NSString *)date
          message:(NSString *)message
             data:(NSString *)data;

@end
