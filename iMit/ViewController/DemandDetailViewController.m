//■ ■ ■
//■ DetailViewController.m
//■ ビューコントローラ - 詳細シーン
//■ ■
#import "Demand.h"
#import "DemandDetailViewController.h"

@interface DemandDetailViewController ()
- (void)configureView;
@end

@implementation DemandDetailViewController

#pragma mark - Managing the detail item

//カスタムsetterメソッド
- (void)setDemand:(Demand *)newDemand
{
    if (_demand != newDemand) {
        _demand = newDemand;
        
        // ビューを更新する
        [self configureView];
    }
}

- (void)configureView
{
    Demand *theDemand = self.demand;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theDemand) {
        self.nameLabel.text = theDemand.name;
        self.codeLabel.text = theDemand.code;
        self.customerNameLabel.text = theDemand.customerName;
        self.employeeNameLabel.text = theDemand.employeeName;
        self.custempNameLabel.text = theDemand.custempName;
        self.amountMoneyLabel.text = theDemand.amountMoney;
        self.closingDateLabel.text = [formatter stringFromDate:(NSDate *)theDemand.closingDate];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewDidUnload
{
    [self setCodeLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
