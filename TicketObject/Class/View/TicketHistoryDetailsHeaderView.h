//
//  TicketHistoryDetailsHeaderView.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketHistoryDetaileModel.h"


@interface TicketHistoryDetailsHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *ticketNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftNumberLabel;

@property (nonatomic,strong) TicketHistoryDetaileModel * ticketModel;

@end
