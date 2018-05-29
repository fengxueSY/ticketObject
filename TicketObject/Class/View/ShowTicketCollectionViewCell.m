//
//  ShowTicketCollectionViewCell.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/16.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "ShowTicketCollectionViewCell.h"

@implementation ShowTicketCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setListModel:(GetTicketListModel *)listModel{
    _listModel = listModel;
    self.nameLabel.text = listModel.lottery_name;
}
@end
