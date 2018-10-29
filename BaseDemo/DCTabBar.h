//
//  DCTabBar.h
//  BaseDemo
//
//  Created by 大橙子 on 2018/10/29.
//  Copyright © 2018 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum
{
    DCTabBarTypeNormal,
    DCTabBarTypeTop,
}DCTabBarType;

typedef void(^plusBtnBlock)(UIButton *button);
@interface DCTabBar : UITabBar
@property (nonatomic,assign) DCTabBarType type;
@property (nonatomic,copy) plusBtnBlock block;
@end

NS_ASSUME_NONNULL_END
