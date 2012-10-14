//■ ■ ■
//■ EstimateViewController.m
//■ ビューコントローラ - マスタシーン
//■ ■
#import "EstimateViewController.h"
#import "EstimateDataController.h"
#import "Estimate.h"
#import "EstimateDetailViewController.h"
#import "AddEstimateViewController.h"

//デリゲートプロトコルへの[ View Controller ]の準拠宣言
@interface EstimateViewController () <AddEstimateViewControllerDelegate,EstimateDataControllerDelegate>
@end

@implementation EstimateViewController

-(void)viewDidLoad
{
    dbgLog(@"in");
    [super viewDidLoad];
    
    self.dataController.delegate = self;

    [self.dataController GetEstimate];
}

- (void)awakeFromNib
{
    dbgLog(@"in");
    [super awakeFromNib];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    dbgLog(@"in");
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    dbgLog(@"in");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    dbgLog(@"in");
    return [self.dataController countOfList];
}

//■ テーブルの行を表示する必要が生じた
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    dbgLog(@"in");
    @try{
        
    static NSString *CellIdentifier = @"EstimateCell";

    //日付の表示に使用する形式を指定
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    //新しいセルを作成
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //マスタリストでユーザーがタップした行に関連づけられた[ Estimate ]オブジェクトを取得
    Estimate *estimateAtIndex =
        [self.dataController objectInListAtIndex:indexPath.row];
    
    //新しいセルのラベルを顧客情報で更新
#if 0
    [[cell textLabel] setText:estimateAtIndex.name];
    [[cell detailTextLabel]
        setText:[formatter stringFromDate:(NSDate *)estimateAtIndex.date]];
#endif
    [[cell textLabel] setText:estimateAtIndex.code];
    [[cell detailTextLabel]setText:estimateAtIndex.name];
    
    return cell;
    }
    @catch(NSException *exception)
    {
        dbgLog( @"neme[ %@ ] reason[ %@ ]", [exception name], [exception reason]);
    }
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //マスタリストでユーザーがタップした行に関連づけられた[ Estimate ]オブジェクトを取得
    Estimate *estimateAtIndex =
    [self.dataController objectInListAtIndex:indexPath.row];
    
    if ([estimateAtIndex.status isEqualToString:@"交渉中"]) { //茶
        cell.textLabel.textColor=[[UIColor brownColor]colorWithAlphaComponent:1.0];
    }
    else if ([estimateAtIndex.status isEqualToString:@"契約待"]) { //茶
        cell.textLabel.textColor=[[UIColor brownColor]colorWithAlphaComponent:1.0];
    }
    else if ([estimateAtIndex.status isEqualToString:@"契約済"]) { //青
        cell.textLabel.textColor=[[UIColor blueColor]colorWithAlphaComponent:1.0];
    }
    else if ([estimateAtIndex.status isEqualToString:@"仮契約"]) { //水色
        cell.textLabel.textColor=[[UIColor cyanColor]colorWithAlphaComponent:1.0];
    }
    else if ([estimateAtIndex.status isEqualToString:@"請求済"]) { //黒
        cell.textLabel.textColor=[[UIColor blackColor]colorWithAlphaComponent:1.0];
    }
    else { //グレー
        cell.textLabel.textColor=[UIColor grayColor];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//■ 詳細シーンへのデータ送信
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowEstimateDetails"])
    {
        EstimateDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.estimate =
            [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } 
    else if ([[segue identifier] isEqualToString:@"ShowAddEstimateView"])
    {
        AddEstimateViewController *addController =
        (AddEstimateViewController *)[[[segue destinationViewController]
                                       viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Receive
- (void)EstimateDataControllerDidReceive:(EstimateDataController *)controller {
    dbgLog(@"in");
    
//    [self.tableView setNeedsDisplay];
    [self.tableView reloadData];
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Cancel
- (void)addEstimateViewControllerDidCancel:(AddEstimateViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Done
- (void)addEstimateViewControllerDidFinish:(AddEstimateViewController *)controller
                                      name:(NSString *)name
                                      code:(NSString *)code
                                    status:(NSString *)status
                              customerName:(NSString *)customerName
                              employeeName:(NSString *)employeeName
                               amountMoney:(NSString *)amountMoney
                                  makeDate:(NSDate *)makeDate
                              deliveryDate:(NSDate *)deliveryDate
{
    if ([name length] || [code length]) {

        //ユーザの入力内容を[ DataController ]の[ addEstimateWithName:code ]メソッドに送信
        [self.dataController addEstimateWithName:name
                                            code:code
                                          status:status
                                    customerName:customerName
                                    employeeName:employeeName
                                     amountMoney:amountMoney
                                        makeDate:makeDate
                                    deliveryDate:deliveryDate];
        //マスタリストを更新し、新しいアイテムを表示
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
