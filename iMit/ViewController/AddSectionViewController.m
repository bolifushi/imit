//■ ■ ■
//■ AddSectionViewController.m
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import "AddSectionViewController.h"

@implementation AddSectionViewController

//--------------------------------------------------------------//
#pragma mark -- [ UITextFieldDelegate ] --
//--------------------------------------------------------------//

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.sectionNameInput) || (textField == self.codeInput))
    {
        [textField resignFirstResponder];
    }
    return YES;
}

//--------------------------------------------------------------//
#pragma mark -- [ Action ] --
//--------------------------------------------------------------//

- (IBAction)cancel:(id)sender {
    [[self delegate] addSectionViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addSectionViewControllerDidFinish:self
                                                  name:self.sectionNameInput.text
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
    [self setSectionNameInput:nil];
    [self setCodeInput:nil];
    [self setCodeInput:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
