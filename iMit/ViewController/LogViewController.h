//■ ■ ■
//■ LogViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ LogDataController ]クラスの前方宣言
@class LogDataController;

@interface LogViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) LogDataController *dataController;
@property (nonatomic, retain) NSString *inputName, *inputCcode;

@end
