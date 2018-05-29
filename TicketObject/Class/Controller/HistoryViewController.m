//
//  HistoryViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryTableViewCell.h"
#import "HistoryListModel.h"
#import "TicketHistoryDetailsViewController.h"

@interface HistoryViewController (){
    
}
@property (nonatomic,assign) NSInteger pageNumber;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.listModel.lottery_name;
    self.pageNumber = 1;
    self.dataArray = [[NSMutableArray alloc]init];
    [self creatBaseUI];
}
-(void)getDataHttps{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setValue:JHKey forKey:@"key"];
    [dic setValue:self.listModel.lottery_id forKey:@"lottery_id"];
    [dic setValue:@"20" forKey:@"page_size"];
    [dic setValue:[NSString stringWithFormat:@"%ld",self.pageNumber] forKey:@"page"];
    __weak typeof(self) wself = self;
    [HistoryListModel getHistoryListParameter:dic Succe:^(id succeed) {
        __strong typeof(wself) sself = wself;
        NSArray * array = (NSArray *)succeed;
        [sself.dataArray addObjectsFromArray:array];
        [sself.dataTableView reloadData];
        [sself.dataTableView.mj_header endRefreshing];
        [sself.dataTableView.mj_footer endRefreshing];
    } Fail:^(id failed) {
        __strong typeof(wself) sself = wself;
        [MBProgressHUD showError:failed];
        [sself.dataTableView.mj_header endRefreshing];
        [sself.dataTableView.mj_footer endRefreshing];
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
    
    __weak typeof(self) wself = self;
    self.dataTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(wself) sself = wself;
        sself.pageNumber = 1;
        [sself getDataHttps];
    }];
    [self.dataTableView.mj_header beginRefreshing];
    self.dataTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        __strong typeof(wself) sself = wself;
        if (sself.dataArray.count == 0) {
            sself.pageNumber = 1;
            [sself getDataHttps];
        }else if (sself.dataArray.count < 20) {
            [MBProgressHUD showTwoSecondMessage:@"数据已加载完毕" toView:sself.view];
            [sself.dataTableView.mj_footer endRefreshing];
        }else{
            if (sself.dataArray.count % 20 == 0) {
                sself.pageNumber++;
                [sself getDataHttps];
            }else{
                [sself.dataTableView.mj_footer endRefreshing];
            }
        }
    }];
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HistoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HistoryTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HistoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HistoryTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    HistoryListModel * model = self.dataArray[indexPath.row];
    cell.listModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HistoryListModel * model = self.dataArray[indexPath.row];
    TicketHistoryDetailsViewController * ticket = [[TicketHistoryDetailsViewController alloc]init];
    ticket.listModel = model;
    [self.navigationController pushViewController:ticket animated:YES];
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
