//
//  TicketHistoryDetailsViewController.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BaseViewController.h"
#import "HistoryListModel.h"

@interface TicketHistoryDetailsViewController : BaseViewController
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * dataTableView;
@property (nonatomic,strong) HistoryListModel * listModel;
@end
