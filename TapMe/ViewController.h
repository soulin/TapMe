//
//  ViewController.h
//  TapMe
//
//  Created by wikimo on 13-8-23.
//  Copyright (c) 2013年 com.wiki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scroeLabel;
    IBOutlet UILabel *timerLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
}

- (IBAction)bottonPressed;
@end
