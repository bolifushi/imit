//■ ■ ■
//■ CustomerViewController.m
//■ ビューコントローラ - マスタシーン
//■ ■
#import "CustomerViewController.h"
#import "CustomerDataController.h"
#import "Customer.h"
#import "CustomerDetailViewController.h"
#import "AddCustomerViewController.h"

//デリゲートプロトコルへの[ View Controller ]の準拠宣言
@interface CustomerViewController () <AddCustomerViewControllerDelegate>
@end

@implementation CustomerViewController

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
    static NSString *CellIdentifier = @"CustomerCell";

    //日付の表示に使用する形式を指定
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    //新しいセルを作成
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //マスタリストでユーザーがタップした行に関連づけられた[ Customer ]オブジェクトを取得
    Customer *customerAtIndex =
        [self.dataController objectInListAtIndex:indexPath.row];
    
    //新しいセルのラベルを顧客情報で更新
    [[cell textLabel] setText:customerAtIndex.name];
    [[cell detailTextLabel]
        setText:[formatter stringFromDate:(NSDate *)customerAtIndex.date]];
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
    if ([[segue identifier] isEqualToString:@"ShowCustomerDetails"])
    {
        CustomerDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.customer =
            [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } 
    else if ([[segue identifier] isEqualToString:@"ShowAddCustomerView"])
    {
        AddCustomerViewController *addController =
        (AddCustomerViewController *)[[[segue destinationViewController]
                                       viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

//Cancel
- (void)addCustomerViewControllerDidCancel:(AddCustomerViewController *)controller {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Done
- (void)addCustomerViewControllerDidFinish:(AddCustomerViewController *)controller
                                      name:(NSString *)name
                                  code:(NSString *)code
{
    if ([name length] || [code length]) {

        //ユーザの入力内容を[ DataController ]の[ addCustomerWithName:code ]メソッドに送信
        [self.dataController addCustomerWithName:name
                                        code:code];
        //マスタリストを更新し、新しいアイテムを表示
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
