//■ ■ ■
//■ PaymentViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ PaymentDataController ]クラスの前方宣言
@class PaymentDataController;

@interface PaymentViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) PaymentDataController *dataController;
@property (nonatomic, retain) NSString *inputName, *inputCcode;

@end
