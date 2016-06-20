//
//  HQNavigationController.m
//  NavigationBarHiddenDemo
//
//  Created by 周焕强 on 16/6/18.
//  Copyright © 2016年 zhq. All rights reserved.
//

#import "HQNavigationController.h"

@interface HQNavigationController ()

@end

@implementation HQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    // 关闭导航栏的透明效果
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    navigationBar.translucent = NO;
}

/**
 *  拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // push的时候隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
