//■ ■ ■
//■ DetailViewController.m
//■ ビューコントローラ - 詳細シーン
//■ ■
#import "Customer.h"
#import "CustomerDetailViewController.h"

@interface CustomerDetailViewController ()
- (void)configureView;
@end

@implementation CustomerDetailViewController

#pragma mark - Managing the detail item

//カスタムsetterメソッド
- (void)setCustomer:(Customer *)newCustomer
{
    if (_customer != newCustomer) {
        _customer = newCustomer;
        
        // ビューを更新する
        [self configureView];
    }
}

- (void)configureView
{
    Customer *theCustomer = self.customer;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theCustomer) {
        self.customerNameLabel.text = theCustomer.name;
        self.codeLabel.text = theCustomer.code;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theCustomer.date];
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
