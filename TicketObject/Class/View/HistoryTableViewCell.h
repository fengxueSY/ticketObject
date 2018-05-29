//
//  HistoryTableViewCell.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryListModel.h"

@interface HistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ticketNo;
@property (weak, nonatomic) IBOutlet UILabel *ticketNumber;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) HistoryListModel * listModel;
@end
