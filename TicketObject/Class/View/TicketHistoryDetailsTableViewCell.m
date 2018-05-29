//
//  TicketHistoryDetailsTableViewCell.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "TicketHistoryDetailsTableViewCell.h"

@implementation TicketHistoryDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setPrizeModel:(TicketHistoryDetaileModel_lottery_prize *)prizeModel{
    _prizeModel = prizeModel;
    self.numberLabel.text = prizeModel.prize_name;
    self.pNumber.text = [NSString stringWithFormat:@"注数：%@",prizeModel.prize_num];
    self.moneyLabel.text = [NSString stringWithFormat:@"每注奖金：%@元",prizeModel.prize_amount];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
