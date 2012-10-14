//■ ■ ■
//■ DemandViewController.m
//■ ビューコントローラ - マスタシーン
//■ ■
#import "DemandViewController.h"
#import "DemandDataController.h"
#import "Demand.h"
#import "DemandDetailViewController.h"
#import "AddDemandViewController.h"

//デリゲートプロトコルへの[ View Controller ]の準拠宣言
@interface DemandViewController () <AddDemandViewControllerDelegate,DemandDataControllerDelegate>

@end

@implementation DemandViewController

-(void)viewDidLoad
{
    dbgLog(@"in");
    [super viewDidLoad];
    
    self.dataController.delegate = self;
    
    [self.dataController GetDemand];
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
    static NSString *CellIdentifier = @"DemandCell";

    //日付の表示に使用する形式を指定
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    //新しいセルを作成
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //マスタリストでユーザーがタップした行に関連づけられた[ Demand ]オブジェクトを取得
    Demand *demandAtIndex =
        [self.dataController objectInListAtIndex:indexPath.row];
    
    //新しいセルのラベルを顧客情報で更新
#if 0
    [[cell textLabel] setText:demandAtIndex.name];
    [[cell detailTextLabel]
        setText:[formatter stringFromDate:(NSDate *)demandAtIndex.date]];
#endif
    [[cell textLabel] setText:demandAtIndex.code];
    [[cell detailTextLabel]setText:demandAtIndex.name];
    
    cell.backgroundColor=[UIColor yellowColor];
//    if ([demandAtIndex.status isEqualToString:@"請可"]) {
//        cell.backgroundColor=[UIColor yellowColor];
//    }
//    else if ([demandAtIndex.status isEqualToString:@"請済"]) {
//        cell.backgroundColor=[UIColor greenColor];
//    }
//    else {
//        cell.backgroundColor=[UIColor whiteColor];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //マスタリストでユーザーがタップした行に関連づけられた[ Demand ]オブジェクトを取得
    Demand *demandAtIndex =
    [self.dataController objectInListAtIndex:indexPath.row];

    if ([demandAtIndex.status isEqualToString:@"請可"]) {
        cell.backgroundColor=[[UIColor yellowColor]colorWithAlphaComponent:0.3];
    }
    else if ([demandAtIndex.status isEqualToString:@"請済"]) {
        cell.backgroundColor=[[UIColor greenColor]colorWithAlphaComponent:0.3];
    }
    else {
        cell.backgroundColor=[UIColor whiteColor];
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
    if ([[segue identifier] isEqualToString:@"ShowDemandDetails"])
    {
        DemandDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.demand =
            [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } 
    else if ([[segue identifier] isEqualToString:@"ShowAddDemandView"])
    {
        AddDemandViewController *addController =
        (AddDemandViewController *)[[[segue destinationViewController]
                                       viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Receive
- (void)DemandDataControllerDidReceive:(DemandDataController *)controller {
    dbgLog(@"in");
    
    //    [self.tableView setNeedsDisplay];
    [self.tableView reloadData];
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Cancel
- (void)addDemandViewControllerDidCancel:(AddDemandViewController *)controller {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Done
- (void)addDemandViewControllerDidFinish:(AddDemandViewController *)controller
                                    name:(NSString *)name
                                    code:(NSString *)code
                                  status:(NSString *)status
                            customerName:(NSString *)customerName
                            employeeName:(NSString *)employeeName
                             custempName:(NSString *)custempName
                             amountMoney:(NSString *)amountMoney
                             closingDate:(NSDate *)closingDate
{
    if ([name length] || [code length]) {

        //ユーザの入力内容を[ DataController ]の[ addDemandWithName:code ]メソッドに送信
        [self.dataController addDemandWithName:name
                                          code:code
                                        status:status
                                  customerName:customerName
                                  employeeName:employeeName
                                   custempName:custempName
                                   amountMoney:amountMoney
                                  closingDate:closingDate];
        //マスタリストを更新し、新しいアイテムを表示
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
