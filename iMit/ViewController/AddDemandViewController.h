//■ ■ ■
//■ AddDemandViewController.h
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import <UIKit/UIKit.h>

//デリゲートプロトコル宣言
@protocol AddDemandViewControllerDelegate;

@interface AddDemandViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

//デリゲートプロパティ
@property (weak, nonatomic) id <AddDemandViewControllerDelegate> delegate;

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

@protocol AddDemandViewControllerDelegate <NSObject>
- (void)addDemandViewControllerDidCancel:(AddDemandViewController *)controller;
- (void)addDemandViewControllerDidFinish:(AddDemandViewController *)controller
                                      name:(NSString *)name
                                  code:(NSString *)code;
@end
