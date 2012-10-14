//■ ■ ■
//■ AddPaymentViewController.m
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import "AddPaymentViewController.h"

@implementation AddPaymentViewController

//--------------------------------------------------------------//
#pragma mark -- [ UITextFieldDelegate ] --
//--------------------------------------------------------------//

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.nameInput) || (textField == self.codeInput))
    {
        [textField resignFirstResponder];
    }
    return YES;
}

//--------------------------------------------------------------//
#pragma mark -- [ Action ] --
//--------------------------------------------------------------//

- (IBAction)cancel:(id)sender {
    [[self delegate] addPaymentViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addPaymentViewControllerDidFinish:self
                                                  name:self.nameInput.text
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
    [self setNameInput:nil];
    [self setCodeInput:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
