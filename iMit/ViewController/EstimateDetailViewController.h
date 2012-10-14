//■ ■ ■
//■ DetailViewController.h
//■ ビューコントローラ - 詳細シーン
//■ ■
#import <UIKit/UIKit.h>

//[ Estimate ]クラスの前方宣言
@class Estimate;

@interface EstimateDetailViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (strong, nonatomic) Estimate *estimate;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *makeDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deliveryDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeNameLabel;

@end
