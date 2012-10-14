//■ ■ ■
//■ AddCustomerViewController.h
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import <UIKit/UIKit.h>

//デリゲートプロトコル宣言
@protocol AddCustomerViewControllerDelegate;

@interface AddCustomerViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

//デリゲートプロパティ
@property (weak, nonatomic) id <AddCustomerViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *customerNameInput;
@property (weak, nonatomic) IBOutlet UITextField *codeInput;

//--------------------------------------------------------------//
#pragma mark -- [ Action ] --
//--------------------------------------------------------------//

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end

//--------------------------------------------------------------//
#pragma mark -- [ Protocol Method ] --
//--------------------------------------------------------------//

@protocol AddCustomerViewControllerDelegate <NSObject>
- (void)addCustomerViewControllerDidCancel:(AddCustomerViewController *)controller;
- (void)addCustomerViewControllerDidFinish:(AddCustomerViewController *)controller
                                      name:(NSString *)name
                                  code:(NSString *)code;
@end
