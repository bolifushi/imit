//■ ■ ■
//■ AddEstimateViewController.h
//■ ビューコントローラ - 新しい項目の追加シーン
//■ ■
#import <UIKit/UIKit.h>

//デリゲートプロトコル宣言
@protocol AddEstimateViewControllerDelegate;

@interface AddEstimateViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

//--------------------------------------------------------------//
#pragma mark -- [ Property ] --
//--------------------------------------------------------------//

//デリゲートプロパティ
@property (weak, nonatomic) id <AddEstimateViewControllerDelegate> delegate;

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

@protocol AddEstimateViewControllerDelegate <NSObject>
- (void)addEstimateViewControllerDidCancel:(AddEstimateViewController *)controller;
- (void)addEstimateViewControllerDidFinish:(AddEstimateViewController *)controller
                                      name:(NSString *)name
                                      code:(NSString *)code
                                    status:(NSString *)status
                              customerName:(NSString *)customerName
                              employeeName:(NSString *)employeeName
                               amountMoney:(NSString *)amountMoney
                                  makeDate:(NSDate *)makeDate
                              deliveryDate:(NSDate *)deliveryDate;
@end
