//■ ■ ■
//■ DetailViewController.m
//■ ビューコントローラ - 詳細シーン
//■ ■
#import "Payment.h"
#import "PaymentDetailViewController.h"

@interface PaymentDetailViewController ()
- (void)configureView;
@end

@implementation PaymentDetailViewController

#pragma mark - Managing the detail item

//カスタムsetterメソッド
- (void)setPayment:(Payment *)newPayment
{
    if (_payment != newPayment) {
        _payment = newPayment;
        
        // ビューを更新する
        [self configureView];
    }
}

- (void)configureView
{
    Payment *thePayment = self.payment;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (thePayment) {
        self.nameLabel.text = thePayment.name;
        self.codeLabel.text = thePayment.code;
        self.customerNameLabel.text = thePayment.customerName;
        self.employeeNameLabel.text = thePayment.employeeName;
        self.amountMoneyLabel.text = thePayment.amountMoney;
        self.receiveDateLabel.text = [formatter stringFromDate:(NSDate *)thePayment.receiveDate];
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
