//
//  CAShapeLayerViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/16.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "CAShapeLayerViewController.h"

@interface CAShapeLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *view1;

@end

@implementation CAShapeLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create path
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.containerView.layer addSublayer:shapeLayer];
    
    
    
    
    
    //define path parameters
    CGRect rect = CGRectMake(50, 80, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    //create shape layer
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.strokeColor = [UIColor redColor].CGColor;
    shapeLayer1.lineWidth = 5;
    shapeLayer1.path = path1.CGPath;
    
    //add it to our view
    [self.view1.layer addSublayer:shapeLayer1];
    
    CALayer* layer2 = [CALayer layer];
    layer2.frame = CGRectMake(10, 10, 80, 80);
    layer2.backgroundColor = [UIColor cyanColor].CGColor;
    [shapeLayer1 addSublayer:layer2];
    
    
}

@end
