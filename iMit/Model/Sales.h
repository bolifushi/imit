//■ ■ ■
//■ Sales.h
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import <Foundation/Foundation.h>

@interface Sales : NSObject

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *amountMoney;  //金額

//--------------------------------------------------------------//
#pragma mark -- [ Instance Method ] --
//--------------------------------------------------------------//

//■　カスタムイニシャライザメソッド
-(id)initWithName:(NSString *)name
             code:(NSString *)code
      amountMoney:(NSString *)amountMoney;

@end
