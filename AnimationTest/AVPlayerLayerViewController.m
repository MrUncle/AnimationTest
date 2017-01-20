//
//  AVPlayerLayerViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/16.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "AVPlayerLayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerLayerViewController ()
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *containerView1;
@end

@implementation AVPlayerLayerViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self addition];
    [self addition1];
}


- (void)addition{
    //get video URL
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"LT_AD" withExtension:@"mp4"];
    
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
    
    //play the video
    [player play];
}

- (void)addition1{
    //get video URL
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"LT_AD" withExtension:@"mp4"];
    
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
  
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView1.bounds;
    [self.containerView1.layer addSublayer:playerLayer];
    
    //transform layer
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
    playerLayer.transform = transform;
    
    //add rounded corners and border
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    playerLayer.borderColor = [UIColor redColor].CGColor;
    playerLayer.borderWidth = 5.0;
    
    //play the video
    [player play];
}
@end
