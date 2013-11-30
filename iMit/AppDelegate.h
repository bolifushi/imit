//■ ■ ■
//■ AppDelegate.h
//■ アプリケーションデリゲート ヘッダファイル
//■ ■
#import <UIKit/UIKit.h>

@class CustomerDataController;
@class CustomerViewController;
@class SectionDataController;
@class SectionViewController;
@class EstimateDataController;
@class EstimateViewController;
@class DemandDataController;
@class DemandViewController;
@class PaymentDataController;
@class PaymentViewController;
@class SalesDataController;
@class SalesViewController;
@class LogDataController;
@class LogViewController;
@class MituSocket;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
#if 0
@property (strong, nonatomic) CustomerDataController *dataController;
@property (strong, nonatomic) CustomerViewController *firstViewController;
@property (strong, nonatomic) SectionDataController *dataController;
@property (strong, nonatomic) SectionViewController *firstViewController;
#endif
#if 1
@property (strong, nonatomic) EstimateDataController *dataController;
//@property (strong, nonatomic) EstimateViewController *firstViewController;
//@property (strong, nonatomic) DemandDataController *dataController;
//@property (strong, nonatomic) DemandViewController *secondViewController;
//@property (strong, nonatomic) PaymentViewController *thirdViewController;
//@property (strong, nonatomic) SalesViewController *fourthViewController;
//@property (strong, nonatomic) LogViewController *fifthViewController;
#endif
#if 0
@property (strong, nonatomic) DemandDataController *dataController;
@property (strong, nonatomic) DemandViewController *firstViewController;
@property (strong, nonatomic) PaymentDataController *dataController;
@property (strong, nonatomic) PaymentViewController *firstViewController;
#endif

@property (strong, nonatomic) MituSocket *mituSocket;

@end
