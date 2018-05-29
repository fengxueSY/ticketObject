//
//  TicketHistoryDetailsViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "TicketHistoryDetailsViewController.h"
#import "TicketHistoryDetailsTableViewCell.h"
#import "TicketHistoryDetaileModel.h"
#import "TicketHistoryDetailsHeaderView.h"

@interface TicketHistoryDetailsViewController ()
@property (nonatomic,strong) TicketHistoryDetaileModel * ticketModel;
@property (nonatomic,strong) TicketHistoryDetailsHeaderView * headerView;
@end

@implementation TicketHistoryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"第%@期",self.listModel.lottery_no];
    [self getDataHttps];
    [self creatBaseUI];
}
-(void)getDataHttps{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setValue:JHKey forKey:@"key"];
    [dic setValue:self.listModel.lottery_id forKey:@"lottery_id"];
    [dic setValue:self.listModel.lottery_no forKey:@"lottery_no"];
    __weak typeof(self) wself = self;
    [TicketHistoryDetaileModel getTicketHistoryDetailsParameter:dic Succeed:^(id succeed) {
        __strong typeof(wself) sself = wself;
        sself.ticketModel = (TicketHistoryDetaileModel *)succeed;
        [sself.dataTableView reloadData];
    } Fail:^(id failed) {
        
    }];
}
-(void)creatBaseUI{
    self.dataTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight)];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    self.dataTableView.backgroundColor = [UIColor blackColor];
    self.dataTableView.tableFooterView = [UIView new];
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:self.dataTableView];
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TicketHistoryDetailsTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TicketHistoryDetailsTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ticketModel.lottery_prize.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 180;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [UIView new];
    [headerView addSubview:self.headerView];
    self.headerView.ticketModel = self.ticketModel;
    self.headerView.frame = headerView.bounds;
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TicketHistoryDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TicketHistoryDetailsTableViewCell class])];
    TicketHistoryDetaileModel_lottery_prize * prizeModel = self.ticketModel.lottery_prize[indexPath.row];
    cell.prizeModel = prizeModel;
    return cell;
}
-(TicketHistoryDetailsHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([TicketHistoryDetailsHeaderView class]) owner:self options:0]lastObject];
    }
    return _headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
