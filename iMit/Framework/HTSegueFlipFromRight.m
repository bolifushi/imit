//
//  HTSegueNormal.m
//  iMit
//
//  Created by hsaito on 2012/10/19.
//  Copyright (c) 2012年 斉藤 仁. All rights reserved.
//

#import "HTSegueFlipFromRight.h"

@implementation HTSegueFlipFromRight

- (void) perform
{
    UIWindow *window = [self.sourceViewController view].window;
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:YES];
    
     [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:NULL];
}
@end
