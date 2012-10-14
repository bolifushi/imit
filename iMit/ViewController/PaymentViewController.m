//■ ■ ■
//■ PaymentViewController.m
//■ ビューコントローラ - マスタシーン
//■ ■
#import "PaymentViewController.h"
#import "PaymentDataController.h"
#import "Payment.h"
#import "PaymentDetailViewController.h"
#import "AddPaymentViewController.h"

//デリゲートプロトコルへの[ View Controller ]の準拠宣言
@interface PaymentViewController () <AddPaymentViewControllerDelegate,PaymentDataControllerDelegate>
@end

@implementation PaymentViewController

-(void)viewDidLoad
{
    dbgLog(@"in");
    [super viewDidLoad];
    
    self.dataController.delegate = self;
    
    [self.dataController GetPayment];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

//■ テーブルの行を表示する必要が生じた
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PaymentCell";

    //日付の表示に使用する形式を指定
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    //新しいセルを作成
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //マスタリストでユーザーがタップした行に関連づけられた[ Payment ]オブジェクトを取得
    Payment *paymentAtIndex =
        [self.dataController objectInListAtIndex:indexPath.row];
    
    //新しいセルのラベルを顧客情報で更新
#if 0
    [[cell textLabel] setText:paymentAtIndex.name];
    [[cell detailTextLabel]
        setText:[formatter stringFromDate:(NSDate *)paymentAtIndex.date]];
#endif
    [[cell textLabel] setText:paymentAtIndex.code];
    [[cell detailTextLabel]setText:paymentAtIndex.name];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//■ 詳細シーンへのデータ送信
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowPaymentDetails"])
    {
        PaymentDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.payment =
            [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } 
    else if ([[segue identifier] isEqualToString:@"ShowAddPaymentView"])
    {
        AddPaymentViewController *addController =
        (AddPaymentViewController *)[[[segue destinationViewController]
                                       viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Receive
- (void)PaymentDataControllerDidReceive:(PaymentDataController *)controller {
    dbgLog(@"in");
    
    //    [self.tableView setNeedsDisplay];
    [self.tableView reloadData];
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Cancel
- (void)addPaymentViewControllerDidCancel:(AddPaymentViewController *)controller {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Done
- (void)addPaymentViewControllerDidFinish:(AddPaymentViewController *)controller
                                     name:(NSString *)name
                                     code:(NSString *)code
                                   status:(NSString *)status
                             customerName:(NSString *)customerName
                             employeeName:(NSString *)employeeName
                              amountMoney:(NSString *)amountMoney
                              receiveDate:(NSDate *)receiveDate
{
    if ([name length] || [code length]) {

        //ユーザの入力内容を[ DataController ]の[ addPaymentWithName:code ]メソッドに送信
        [self.dataController addPaymentWithName:name
                                           code:code
                                         status:status
                                   customerName:customerName
                                   employeeName:employeeName
                                    amountMoney:amountMoney
                                    receiveDate:receiveDate];

        //マスタリストを更新し、新しいアイテムを表示
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
