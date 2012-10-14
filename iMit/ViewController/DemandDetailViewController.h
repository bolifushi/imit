//■ ■ ■
//■ DemandDetailViewController.h
//■ ビューコントローラ - 詳細シーン
//■ ■
#import <UIKit/UIKit.h>

//[ Demand ]クラスの前方宣言
@class Demand;

@interface DemandDetailViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (strong, nonatomic) Demand *demand;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *closingDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *custempNameLabel;

@end
