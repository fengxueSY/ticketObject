//
//  SettingLoginAfterView.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "SettingLoginAfterView.h"

@implementation SettingLoginAfterView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.headerImageView.layer setMasksToBounds:YES];
    [self.headerImageView.layer setCornerRadius:40];
}

@end
