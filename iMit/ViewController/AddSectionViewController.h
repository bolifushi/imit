//■ ■ ■
//■ AddSectionViewController.h
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import <UIKit/UIKit.h>

//デリゲートプロトコル宣言
@protocol AddSectionViewControllerDelegate;

@interface AddSectionViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

//デリゲートプロパティ
@property (weak, nonatomic) id <AddSectionViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *sectionNameInput;
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

@protocol AddSectionViewControllerDelegate <NSObject>
- (void)addSectionViewControllerDidCancel:(AddSectionViewController *)controller;
- (void)addSectionViewControllerDidFinish:(AddSectionViewController *)controller
                                      name:(NSString *)name
                                  code:(NSString *)code;
@end
