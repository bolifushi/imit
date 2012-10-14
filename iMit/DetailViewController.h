//
//  DetailViewController.h
//  iMit
//
//  Created by hsaito on 2012/10/14.
//  Copyright (c) 2012年 斉藤 仁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
