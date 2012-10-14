//■ ■ ■
//■ PaymentDetailViewController.h
//■ ビューコントローラ - 詳細シーン
//■ ■
#import <UIKit/UIKit.h>

//[ Payment ]クラスの前方宣言
@class Payment;

@interface PaymentDetailViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (strong, nonatomic) Payment *payment;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *receiveDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeNameLabel;

@end
