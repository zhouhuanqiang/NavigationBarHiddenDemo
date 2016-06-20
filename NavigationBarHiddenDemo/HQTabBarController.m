//
//  HQTabBarController.m
//  NavigationBarHiddenDemo
//
//  Created by 周焕强 on 16/6/18.
//  Copyright © 2016年 zhq. All rights reserved.
//

#import "HQTabBarController.h"
#import "HQIndexViewController.h"
#import "HQMineViewController.h"
#import "HQNavigationController.h"

@interface HQTabBarController ()<UITabBarControllerDelegate>

@end

@implementation HQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    self.delegate = self;
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    
    [self addChildVc];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    UINavigationController *navigationController = (UINavigationController *)viewController;
    
    if ([navigationController.topViewController isKindOfClass:[HQMineViewController class]])
    {
        HQMineViewController *mineVc = (HQMineViewController *)navigationController.topViewController;
        // 点击TabBarItem进入"我的"控制器 会关闭导航栏消失的动画
        mineVc.closeAnimating = YES;
    }
    return YES;
}

- (void)addChildVc
{
    // 1.首页
    HQIndexViewController * indexVc = [[HQIndexViewController alloc]init];
    indexVc.title = @"有NavigationBar";
    [self addChildViewController:indexVc title:@"首页" image:@"index" selectedImage:@"index_selected"];
    
    // 2.我的
    HQMineViewController *meVc = [[HQMineViewController alloc] init];
    [self addChildViewController:meVc title:@"我的" image:@"me" selectedImage:@"me_selected"];
}

- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 1.设置标题
    childVc.tabBarItem.title = title;
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
    
    // 2.设置图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 3.包装一个导航控制器并设置为子控制器
    HQNavigationController *nav = [[HQNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
