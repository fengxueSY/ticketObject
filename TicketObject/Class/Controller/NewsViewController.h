//
//  NewsViewController.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * dataTableView;
@end
