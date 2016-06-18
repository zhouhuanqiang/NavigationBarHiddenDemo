//
//  HQIndexViewController.m
//  NavigationBarHiddenDemo
//
//  Created by 周焕强 on 16/6/18.
//  Copyright © 2016年 zhq. All rights reserved.
//

#import "HQIndexViewController.h"
#import "HQSecondViewController.h"

@interface HQIndexViewController ()

@end

@implementation HQIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    pushBtn.center = self.view.center;
    [pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:[UIColor whiteColor]];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

- (void)push {
   
    [self.navigationController pushViewController:[[HQSecondViewController alloc] init] animated:YES];
    
}



@end
