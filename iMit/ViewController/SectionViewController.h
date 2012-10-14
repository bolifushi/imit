//■ ■ ■
//■ SectionViewController.h
//■ ビューコントローラ - マスタシーン
//■ ■
#import <UIKit/UIKit.h>

//[ SectionDataController ]クラスの前方宣言
@class SectionDataController;

@interface SectionViewController : UITableViewController

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//
//[ DataController ]プロパティ
@property (nonatomic, retain) SectionDataController *dataController;
@property (nonatomic, retain) NSString *inputSectionName, *inputCcode;

@end
