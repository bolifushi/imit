//■ ■ ■
//■ CustomerDetailViewController.h
//■ ビューコントローラ - 詳細シーン
//■ ■
#import <UIKit/UIKit.h>

//[ Customer ]クラスの前方宣言
@class Customer;

@interface CustomerDetailViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (strong, nonatomic) Customer *customer;
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
