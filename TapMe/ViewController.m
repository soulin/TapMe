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
    
    scroeLabel.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav" loop:NO];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav" loop:NO];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3" loop:YES];
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
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
    

}

- (AVAudioPlayer *) setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type loop:(BOOL)loop{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (loop) {
        audioPlayer.numberOfLoops = -1;
    }
   
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    return audioPlayer;
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
    
    [secondBeep play];
}


- (IBAction)bottonPressed {
    count++; 
    scroeLabel.text = [NSString stringWithFormat:@"分数:\n%i", count];
//    NSLog(@"pressed!");
    
    [buttonBeep play];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [self setupGame];

}

@end
