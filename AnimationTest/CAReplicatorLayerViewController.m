//
//  CAReplicatorLayerViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/16.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "CAReplicatorLayerViewController.h"

@interface ReflectionView : UIView
@end

@implementation ReflectionView

+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

- (void)setUp
{
    //configure replicator
    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;
    
    //move reflection instance below original and flip vertically
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.bounds.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    layer.instanceTransform = transform;
    
    //reduce alpha of reflection layer
    layer.instanceAlphaOffset = -0.6;
}

- (id)initWithFrame:(CGRect)frame
{
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    //this is called when view is created from a nib
    [self setUp];
}
@end


@interface CAReplicatorLayerViewController ()

@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation CAReplicatorLayerViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    //create a replicator layer and add it to our view
    [self view1];
    [self view2];
}

- (void)view1{
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    
    //configure the replicator
    replicator.instanceCount = 10;
    
    //apply a transform for each instance
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 20, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -20, 0);
    replicator.instanceTransform = transform;
    
    //apply a color shift for each instance
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(60.0f, 60.0f, 60.0f, 60.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
}

- (void)view2{
    //
}
@end
