//
//  DCTabBar.m
//  BaseDemo
//
//  Created by 大橙子 on 2018/10/29.
//  Copyright © 2018 中都格罗唯视. All rights reserved.
//

#import "DCTabBar.h"
@interface DCTabBar ()
@property (nonatomic,weak) UIButton *plusButton;
@end
@implementation DCTabBar
-(UIButton *)plusButton
{
    if (!_plusButton) {
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        plusButton.backgroundColor = [UIColor darkGrayColor];
        [plusButton addTarget:self action:@selector(plusButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.type == DCTabBarTypeNormal) {
            [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
            [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        }else{
            [plusButton setImage:[UIImage imageNamed:@"plus_Last"] forState:UIControlStateNormal];
        }
        [self addSubview:plusButton];
        _plusButton = plusButton;
    }
    return _plusButton;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = IMAGENAME(@"tabbar-light");
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonW = self.width/5;
    CGFloat buttonH = self.height;
    CGFloat buttonY = 0;
    
    int buttonIndex = 0;
    
    for (UIView *subView in self.subviews) {
        if (subView.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat buttonX = buttonIndex *buttonW;
        if (buttonIndex >= 2) {
            buttonX += buttonW;
        }
        subView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        buttonIndex ++;
    }
    if (self.type == DCTabBarTypeNormal) {
        self.plusButton.size = CGSizeMake(buttonW, buttonH);
        self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    }else{
        self.plusButton.size = CGSizeMake(buttonH+10, buttonH+10);
        self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5-10);
    }
}
-(void)plusButtonDidClick:(UIButton *)btn
{
    if (_block) {
        _block(btn);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
