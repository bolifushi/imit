//■ ■ ■
//■ DemandViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ DemandDataController ]クラスの前方宣言
@class DemandDataController;

@interface DemandViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) DemandDataController *dataController;
@property (nonatomic, retain) NSString *inputName, *inputCcode;

@end
