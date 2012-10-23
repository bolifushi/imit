//■ ■ ■
//■ SalesViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ SalesDataController ]クラスの前方宣言
@class SalesDataController;

@interface SalesViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) SalesDataController *dataController;
@property (nonatomic, retain) NSString *inputName, *inputCcode;

@end
