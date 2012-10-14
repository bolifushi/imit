//■ ■ ■
//■ AddCustomerViewController.m
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import "AddCustomerViewController.h"

@implementation AddCustomerViewController

//--------------------------------------------------------------//
#pragma mark -- [ UITextFieldDelegate ] --
//--------------------------------------------------------------//

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.customerNameInput) || (textField == self.codeInput))
    {
        [textField resignFirstResponder];
    }
    return YES;
}

//--------------------------------------------------------------//
#pragma mark -- [ Action ] --
//--------------------------------------------------------------//

- (IBAction)cancel:(id)sender {
    [[self delegate] addCustomerViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addCustomerViewControllerDidFinish:self
                                                   name:self.customerNameInput.text
                                                   code:self.codeInput.text];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setCustomerNameInput:nil];
    [self setCodeInput:nil];
    [self setCodeInput:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
