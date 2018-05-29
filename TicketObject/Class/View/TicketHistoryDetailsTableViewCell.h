//
//  TicketHistoryDetailsTableViewCell.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketHistoryDetaileModel.h"

@interface TicketHistoryDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *pNumber;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (nonatomic,strong) TicketHistoryDetaileModel_lottery_prize * prizeModel;
@end
