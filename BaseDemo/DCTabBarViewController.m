//
//  DCTabBarViewController.m
//  BaseDemo
//
//  Created by 大橙子 on 2018/10/29.
//  Copyright © 2018 中都格罗唯视. All rights reserved.
//

#import "DCTabBarViewController.h"
#import "DCFirstViewController.h"
#import "DCSecondViewController.h"
#import "DCThirdViewController.h"
#import "DCForthViewController.h"
#import "DCNavigationViewController.h"
#import "DCTabBar.h"
// ios7
#define iOS7 ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0)
@interface DCTabBarViewController ()

@end

@implementation DCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *norItem = [UITabBarItem appearance];
    NSMutableDictionary *norDic = [NSMutableDictionary dictionary];
    norDic[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    norDic[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [norItem setTitleTextAttributes:norDic forState:UIControlStateNormal];
    
    UITabBarItem *selectedItem = [UITabBarItem appearance];
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [selectedItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
    /** 添加子控制器*/
    [self setUpOneChildViewController:[[DCFirstViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImg:@"tabBar_essence_click_icon"];
    [self setUpOneChildViewController:[[DCSecondViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImg:@"tabBar_new_click_icon"];
    [self setUpOneChildViewController:[[DCThirdViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImg:@"tabBar_friendTrends_click_icon"];
    [self setUpOneChildViewController:[[DCForthViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImg:@"tabBar_me_click_icon"];
    
    //替换系统的tabBar
    DCTabBar *bar = [[DCTabBar alloc]init];
    bar.type = DCTabBarTypeTop;
    bar.block = ^(UIButton * _Nonnull button) {
        NSLog(@"%s",__func__);
    };
    [self setValue:bar forKey:@"tabBar"];
}

-(void)setUpOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImg:(NSString *)selectedImg
{
    vc.tabBarItem.title = title;
    UIImage *selImage = [UIImage imageNamed:selectedImg];
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = selImage;
    }
    //设置tabBarItem的文字在图标的上面
//    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
//    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -28)];
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
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
