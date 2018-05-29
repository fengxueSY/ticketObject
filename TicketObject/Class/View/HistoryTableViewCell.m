//
//  HistoryTableViewCell.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setListModel:(HistoryListModel *)listModel{
    _listModel = listModel;
    self.ticketNo.text = [NSString stringWithFormat:@"第%@期",listModel.lottery_no];
    self.timeLabel.text = listModel.lottery_date;
    self.ticketNumber.text = listModel.lottery_res;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
