//■ ■ ■
//■ EstimateDetailViewController.m
//■ ビューコントローラ - 詳細シーン
//■ ■
#import "Estimate.h"
#import "EstimateDetailViewController.h"

@interface EstimateDetailViewController ()
- (void)configureView;
@end

@implementation EstimateDetailViewController

#pragma mark - Managing the detail item

//カスタムsetterメソッド
- (void)setEstimate:(Estimate *)newEstimate
{
    if (_estimate != newEstimate) {
        _estimate = newEstimate;
        
        // ビューを更新する
        [self configureView];
    }
}

- (void)configureView
{
    Estimate *theEstimate = self.estimate;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theEstimate) {
        self.nameLabel.text = theEstimate.name;
        self.codeLabel.text = theEstimate.code;
        self.customerNameLabel.text = theEstimate.customerName;
        self.employeeNameLabel.text = theEstimate.employeeName;
        self.amountMoneyLabel.text = theEstimate.amountMoney;
        self.makeDateLabel.text = [formatter stringFromDate:(NSDate *)theEstimate.makeDate];
        self.deliveryDateLabel.text = [formatter stringFromDate:(NSDate *)theEstimate.deliveryDate];
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
    [self setNameLabel:nil];
    [self setCustomerNameLabel:nil];
    [self setEmployeeNameLabel:nil];
    [self setAmountMoneyLabel:nil];
    [self setMakeDateLabel:nil];
    [self setDeliveryDateLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
