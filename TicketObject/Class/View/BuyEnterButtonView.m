//
//  BuyEnterButtonView.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BuyEnterButtonView.h"

@implementation BuyEnterButtonView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.senderButton.layer setMasksToBounds:YES];
    [self.senderButton.layer setCornerRadius:10];
}

@end
