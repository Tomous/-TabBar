//
//  DCNavigationViewController.m
//  BaseDemo
//
//  Created by 大橙子 on 2018/10/29.
//  Copyright © 2018 中都格罗唯视. All rights reserved.
//

#import "DCNavigationViewController.h"

@interface DCNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DCNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加测滑手势。。只支持ios 7.0以上版本
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.interactivePopGestureRecognizer.enabled = YES;      // 手势有效设置为YES  无效为NO
        self.interactivePopGestureRecognizer.delegate = self;    // 手势的代理设置为self
    }
    [self.navigationBar setBackgroundImage:IMAGENAME(@"navigationbarBackgroundWhite") forBarMetrics:UIBarMetricsDefault];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:IMAGENAME(@"navigationButtonReturn") forState:UIControlStateNormal];
        [backBtn setImage:IMAGENAME(@"navigationButtonReturnClick") forState:UIControlStateHighlighted];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn sizeToFit];
        
        [backBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back
{
    [self popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
