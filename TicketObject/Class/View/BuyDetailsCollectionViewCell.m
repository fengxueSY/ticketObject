//
//  BuyDetailsCollectionViewCell.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BuyDetailsCollectionViewCell.h"

#define CellWidth ((WindowWidth - 35) / 6) - 10

@implementation BuyDetailsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.textLabel.layer setMasksToBounds:YES];
    [self.textLabel.layer setCornerRadius:10];
    [self.textLabel.layer setBorderWidth:1];

}

@end
