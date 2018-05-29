//
//  BuyTableViewCell.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetTicketListModel.h"

@interface BuyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) GetTicketListModel * listModel;
@end
