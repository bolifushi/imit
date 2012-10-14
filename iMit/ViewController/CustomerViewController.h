//■ ■ ■
//■ CustomerViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ CustomerDataController ]クラスの前方宣言
@class CustomerDataController;

@interface CustomerViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) CustomerDataController *dataController;
@property (nonatomic, retain) NSString *inputCustomerName, *inputCcode;

@end
