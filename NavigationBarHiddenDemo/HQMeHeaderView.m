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
@property (weak, nonatomic) IBOutlet UIImageView *backView;

@end

@implementation HQMeHeaderView

- (void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 37.5;
    self.iconView.clipsToBounds = YES;
}

- (void)scrollViewDidScroll:(CGPoint)offset
{
    if (offset.y < 0) {
        CGRect rect = self.frame;
        rect.origin.y = offset.y;
        rect.size.height = CGRectGetHeight(rect) - offset.y;
        self.backView.frame = rect;
        self.clipsToBounds=NO;
    }
}

@end
