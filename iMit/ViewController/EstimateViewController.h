//■ ■ ■
//■ EstimateViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ EstimateDataController ]クラスの前方宣言
@class EstimateDataController;

@interface EstimateViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) EstimateDataController *dataController;
@property (nonatomic, retain) NSString *inputEstimateName, *inputCcode;

@end
