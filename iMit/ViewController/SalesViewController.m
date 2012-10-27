//■ ■ ■
//■ SalesViewController.m
//■ ビューコントローラ - マスタシーン
//■ ■
#import "SalesViewController.h"
#import "SalesDataController.h"
#import "Sales.h"

//デリゲートプロトコルへの[ View Controller ]の準拠宣言
@interface SalesViewController () <SalesDataControllerDelegate>
@end

@implementation SalesViewController

-(void)viewDidLoad
{
    dbgLog(@"in");
    [super viewDidLoad];
    
    self.dataController.delegate = self;
    
    [self.dataController GetSales];
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
    static NSString *CellIdentifier = @"SalesCell";

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
    Sales *salesAtIndex =
        [self.dataController objectInListAtIndex:indexPath.row];
    
    //新しいセルのラベルを顧客情報で更新
#if 0
    [[cell textLabel] setText:salesAtIndex.name];
    [[cell detailTextLabel]
        setText:[formatter stringFromDate:(NSDate *)salesAtIndex.date]];
#endif
//    [[cell textLabel] setText:salesAtIndex.code];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"(%@%%) %@円",salesAtIndex.percentage,  salesAtIndex.amountMoney]];
    [[cell textLabel]setText:salesAtIndex.name];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Receive
- (void)SalesDataControllerDidReceive:(SalesDataController *)controller {
    dbgLog(@"in");
    
    //    [self.tableView setNeedsDisplay];
    [self.tableView reloadData];
}

@end
