//
//  ViewController.m
//  TapMe
//
//  Created by wikimo on 13-8-23.
//  Copyright (c) 2013年 com.wiki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupGame{
    seconds =  30 ;
    count =  0 ;
    
    timerLabel.text = [NSString stringWithFormat:@"剩余时间: %i", seconds];
    scroeLabel.text = [NSString stringWithFormat:@"分数： \n%i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}

- (void) subtractTime {
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"剩余时间: %i",seconds];
    
    
    if (seconds == 0) {
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"时间到!"
            message:[NSString stringWithFormat:@"分数:\n%i ", count]
            delegate:self
            cancelButtonTitle:@"再玩一次"
            otherButtonTitles:nil ];
        [alert show];
    }
}


- (IBAction)bottonPressed {
    count++; 
    scroeLabel.text = [NSString stringWithFormat:@"分数:\n%i", count];
//    NSLog(@"pressed!");
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [self setupGame];

}

@end
