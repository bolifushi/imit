//■ ■ ■
//■ AddPaymentViewController.h
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import <UIKit/UIKit.h>

//デリゲートプロトコル宣言
@protocol AddPaymentViewControllerDelegate;

@interface AddPaymentViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

//デリゲートプロパティ
@property (weak, nonatomic) id <AddPaymentViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameInput;
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

@protocol AddPaymentViewControllerDelegate <NSObject>
- (void)addPaymentViewControllerDidCancel:(AddPaymentViewController *)controller;
- (void)addPaymentViewControllerDidFinish:(AddPaymentViewController *)controller
                                      name:(NSString *)name
                                  code:(NSString *)code;
@end
