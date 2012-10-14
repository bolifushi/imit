//■ ■ ■
//■ AddDemandViewController.m
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import "AddDemandViewController.h"

@implementation AddDemandViewController

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
    [[self delegate] addDemandViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addDemandViewControllerDidFinish:self
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
    [self setCodeInput:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
