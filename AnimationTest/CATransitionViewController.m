//
//  CATransitionViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/16.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSArray *images;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation CATransitionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up images
    self.images = @[[UIImage imageNamed:@"1.png"],
                    [UIImage imageNamed:@"2.png"],
                    [UIImage imageNamed:@"3.png"],
                    [UIImage imageNamed:@"4.png"]];
}


//- (IBAction)switchImage
//{
//    //set up crossfade transition
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//    //apply transition to imageview backing layer
//    [self.imageView.layer addAnimation:transition forKey:nil];
//    //cycle to next image
//    UIImage *currentImage = self.imageView.image;
//    NSUInteger index = [self.images indexOfObject:currentImage];
//    index = (index + 1) % [self.images count];
//    self.imageView.image = self.images[index];
//}

- (IBAction)switchImage
{
    [UIView transitionWithView:self.imageView duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        //cycle to next image
                        UIImage *currentImage = self.imageView.image;
                        NSUInteger index = [self.images indexOfObject:currentImage];
                        index = (index + 1) % [self.images count];
                        self.imageView.image = self.images[index];
                    }
                    completion:NULL];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    [self.progressView setProgress:red animated:YES];
    
    
}

@end
