//
//  ShadowPathViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/16.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "ShadowPathViewController.h"

@interface ShadowPathViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (weak, nonatomic) IBOutlet UIView *layerView3;
@end

@implementation ShadowPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView2.layer.shadowOpacity = 0.5f;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView3.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    
    CGMutablePathRef ellipsePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(squarePath, NULL, self.layerView3.bounds);
    self.layerView2.layer.shadowPath = ellipsePath;
    CGPathRelease(ellipsePath);
}


@end
