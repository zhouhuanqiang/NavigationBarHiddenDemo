//
//  HQMeHeaderView.m
//  NavigationBarHiddenDemo
//
//  Created by 周焕强 on 16/6/18.
//  Copyright © 2016年 nbnip. All rights reserved.
//

#import "HQMeHeaderView.h"

@interface HQMeHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UIButton *focusBtn;
@property (weak, nonatomic) IBOutlet UIButton *fansBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_backRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_backTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_backLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_backHeight;

@end

@implementation HQMeHeaderView

- (void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 37.5;
    self.iconView.clipsToBounds = YES;
}

- (void)scrollDidScroll:(UIScrollView *)scrollView{
    CGFloat offset_Y = scrollView.contentOffset.y;
    if (offset_Y < 0) {
        self.icon_backTop.constant = offset_Y;
        self.icon_backLeft.constant = offset_Y / 2;
        self.icon_backRight.constant = offset_Y / 2;
        self.icon_backHeight.constant = 240+(-offset_Y);
    }
    [self layoutIfNeeded];
}

@end
