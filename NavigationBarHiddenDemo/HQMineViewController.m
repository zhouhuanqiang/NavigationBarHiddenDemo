//
//  HQMineViewController.m
//  NavigationBarHiddenDemo
//
//  Created by 周焕强 on 16/6/18.
//  Copyright © 2016年 zhq. All rights reserved.
//

#import "HQMineViewController.h"
#import "HQThirdViewController.h"
#import "HQMeHeaderView.h"
@interface HQMineViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) HQMeHeaderView * headerView;



@end

@implementation HQMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HQMeHeaderView" owner:self options:nil] firstObject];
    self.tableView.tableHeaderView = self.headerView;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:!self.closeAnimating];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // 控制器消失时要开启动画，保证由其他方式进入控制器会有动画
    self.closeAnimating = NO;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"setting";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"setting"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"点击跳转%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[HQThirdViewController alloc] init] animated:YES];
    
}



@end
