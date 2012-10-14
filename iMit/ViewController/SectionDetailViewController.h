//■ ■ ■
//■ SectionDetailViewController.h
//■ ビューコントローラ - 詳細シーン
//■ ■
#import <UIKit/UIKit.h>

//[ Section ]クラスの前方宣言
@class Section;

@interface SectionDetailViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

@property (strong, nonatomic) Section *section;
@property (weak, nonatomic) IBOutlet UILabel *sectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
