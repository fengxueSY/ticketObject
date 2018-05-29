//
//  SettingViewController.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/16.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingViewController : BaseViewController
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * dataTableView;
@end
