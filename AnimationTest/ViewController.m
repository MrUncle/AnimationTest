//
//  ViewController.m
//  AnimationTest
//
//  Created by 刘豪亮 on 16/8/15.
//  Copyright © 2016年 刘豪亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) NSArray* titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles = @[@"ShadowPathViewController",@"CAShapeLayerViewController",@"CATextLayerViewController",@"CAGradientLayerViewController",@"CAReplicatorLayerViewController",@"AVPlayerLayerViewController",@"CATransactionViewController",@"CAAnimationGroupViewController",@"CATransitionViewController"];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController* vc = [[NSClassFromString(_titles[indexPath.row]) alloc] init];
    vc.title = _titles[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
