//■ ■ ■
//■ Section.h
//■ モデルレイヤ - データオブジェクトクラス
//■ ■
#import <Foundation/Foundation.h>

@interface Section : NSObject

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *closingDate;
@property (nonatomic, strong) NSDate *paymentDate;
@property (nonatomic, copy) NSString *shipCode;

//--------------------------------------------------------------//
#pragma mark -- [ Instance Method ] --
//--------------------------------------------------------------//

//■　カスタムイニシャライザメソッド
//-(id)initWithName:(NSString *)name
//             Code:(NSString *)code
//             Date:(NSDate *)date
//      ClosingDate:(NSDate *)closingDate
//      PaymentDate:(NSDate *)paymentDate
//         ShipCode:(NSString *)shipCode;

-(id)initWithName:(NSString *)name
             code:(NSString *)code
             date:(NSDate *)date;

@end
