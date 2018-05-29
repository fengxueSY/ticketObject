//
//  TicketHistoryDetailsHeaderView.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "TicketHistoryDetailsHeaderView.h"

@implementation TicketHistoryDetailsHeaderView

-(void)setTicketModel:(TicketHistoryDetaileModel *)ticketModel{
    _ticketModel = ticketModel;
    self.ticketNoLabel.text = [NSString stringWithFormat:@"第%@期",ticketModel.lottery_no];
    self.startTimeLabel.text = ticketModel.lottery_date;
    self.endTimeLabel.text = ticketModel.lottery_exdate;
    self.ticketNumberLabel.text = ticketModel.lottery_res;
    self.sellNumberLabel.text = [NSString stringWithFormat:@"%@元",ticketModel.lottery_sale_amount];
    self.leftNumberLabel.text = [NSString stringWithFormat:@"%@元",ticketModel.lottery_pool_amount];
}

@end
