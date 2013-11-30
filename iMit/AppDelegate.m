//■ ■ ■
//■ AppDelegate.m
//■ アプリケーションデリゲート 実装ファイル
//■ ■
#import "AppDelegate.h"
#import "CustomerDataController.h"
#import "CustomerViewController.h"
#import "SectionDataController.h"
#import "SectionViewController.h"
#import "EstimateViewController.h"
#import "EstimateDataController.h"
#import "DemandViewController.h"
#import "DemandDataController.h"
#import "PaymentViewController.h"
#import "PaymentDataController.h"
#import "SalesViewController.h"
#import "SalesDataController.h"
#import "LogViewController.h"
#import "LogDataController.h"
#import "MituSocket.h"

void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
}

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //シリアルキューの作成
    dispatch_queue_t queue = dispatch_queue_create(
                "net.bolifushi.toyomaint.serial_queue", NULL);
    
    _mituSocket = [[MituSocket alloc]init];
#if 0
    _mituSocket.ipAddress = @"192.168.240.137";
#endif
#if 1
    _mituSocket.ipAddress = @"172.24.3.50";
#endif
#if 0
    _mituSocket.ipAddress = @"172.16.32.134";
#endif
    _mituSocket.port = 8001;
    if(![_mituSocket Connect])
    {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle: @"Like It!"
                                                       message:@"サーバーに接続できませんでした。"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [view show];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"確認します。"
                              message:@"OKですか？"
                              delegate:self
                              cancelButtonTitle:@"キャンセル"
                              otherButtonTitles:@"OK", nil];
        [alert show];

        exit(-1);
    }
    
    //■ 自らの[ window ]プロパテリを使用して、ウィンドウの[ RootViewController ]オブジェクトを取得
#if 0
    //  最初の[ ViewController ]が[ UINavigationController ]であることがわかっている
    UINavigationController *navigationController =
        (UINavigationController *)self.window.rootViewController;
#endif
#if 1
    //  最初の[ ViewController ]が[ UITabBarController ]であることがわかっている
    UITabBarController *tabBarController =
    (UITabBarController *)self.window.rootViewController;
    
    UINavigationController *navigationController;
#endif

#if 0
    //● Customer ●
    //■ [ NavigationController ]の[ ViewController ]配列の零番目のメンバを取得
    CustomerViewController *firstViewController =
        (CustomerViewController *)[[navigationController viewControllers] objectAtIndex:0];
    //■ データコントローラを初期化し、
    CustomerDataController *aDataController = [[CustomerDataController alloc] initWithSocket:(MituSocket*)_mituSocket];
#endif
#if 0
    //● Section ●
    //■ [ NavigationController ]の[ ViewController ]配列の零番目のメンバを取得
    SectionViewController *firstViewController =
    (SectionViewController *)[[navigationController viewControllers] objectAtIndex:0];
    //■ データコントローラを初期化し、
    SectionDataController *aDataController = [[SectionDataController alloc]initWithSocket:(MituSocket*)_mituSocket];
#endif
#if 1
    //● Estimate ●
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:0];

    EstimateViewController *firstViewController =
    (EstimateViewController *)[[navigationController viewControllers] objectAtIndex:0];
    
    //■ データコントローラを初期化し、
    EstimateDataController *estimateDataController =
        [[EstimateDataController alloc]initWithSocket:(MituSocket*)_mituSocket
                                                queue:(dispatch_queue_t)queue];
    
    //■ マスターシーンの[ dataController ]プロパティに割り当て
    firstViewController.dataController = estimateDataController;
#endif
#if 1
    //● Demand ●
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:1];

    DemandViewController *secondViewController =
    (DemandViewController *)[[navigationController viewControllers] objectAtIndex:0];
    
    //■ データコントローラを初期化し、
    DemandDataController *demandDataController =
        [[DemandDataController alloc]initWithSocket:(MituSocket*)_mituSocket
                                              queue:(dispatch_queue_t)queue];
    
    //■ マスターシーンの[ dataController ]プロパティに割り当て
    secondViewController.dataController = demandDataController;
#endif
#if 1
    //● Payment ●
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:2];

    PaymentViewController *thirdViewController =
    (PaymentViewController *)[[navigationController viewControllers] objectAtIndex:0];
    
    //■ データコントローラを初期化し、
    PaymentDataController *paymentDataController =
    [[PaymentDataController alloc]initWithSocket:(MituSocket*)_mituSocket
                                          queue:(dispatch_queue_t)queue];

    //■ マスターシーンの[ dataController ]プロパティに割り当て
    thirdViewController.dataController = paymentDataController;
#endif
#if 1
    //● Sales ●
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:3];
    
    SalesViewController *fourthViewController =
    (SalesViewController *)[[navigationController viewControllers] objectAtIndex:0];
    
    //■ データコントローラを初期化し、
    SalesDataController *salesDataController =
    [[SalesDataController alloc]initWithSocket:(MituSocket*)_mituSocket
                                           queue:(dispatch_queue_t)queue];
    
    //■ マスターシーンの[ dataController ]プロパティに割り当て
    fourthViewController.dataController = salesDataController;
#endif
#if 1
    //● Log ●
    navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:4];
    
    LogViewController *fifthViewController =
    (LogViewController *)[[navigationController viewControllers] objectAtIndex:0];
    
    //■ データコントローラを初期化し、
    LogDataController *logDataController =
    [[LogDataController alloc]initWithSocket:(MituSocket*)_mituSocket
                                         queue:(dispatch_queue_t)queue];
    
    //■ マスターシーンの[ dataController ]プロパティに割り当て
    fifthViewController.dataController = logDataController;
#endif
    
    self.dataController = estimateDataController;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
