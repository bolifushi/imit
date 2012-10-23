//
//  ConfigViewController.h
//  iMit
//
//  Created by hsaito on 2012/10/16.
//  Copyright (c) 2012年 斉藤 仁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigViewController : UITableViewController
<UITextFieldDelegate>
//※ テキストフィールドデリゲートプロトコルを採用

@property (weak, nonatomic) IBOutlet UITextField *inputServer;
@property (weak, nonatomic) IBOutlet UITextField *inputAccount;
@property (weak, nonatomic) IBOutlet UITextField *inputPassword;

@end
