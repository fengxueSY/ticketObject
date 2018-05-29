//
//  HistoryViewController.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BaseViewController.h"
#import "GetTicketListModel.h"
@interface HistoryViewController : BaseViewController
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * dataTableView;
@property (nonatomic,strong) GetTicketListModel * listModel;
@end
