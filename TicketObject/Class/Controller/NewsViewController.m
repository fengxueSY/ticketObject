//
//  NewsViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
// 

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "GetNewsListModel.h"
#import "NewsHtmlViewController.h"

@interface NewsViewController (){
    
}
@property (nonatomic,assign) NSInteger pageNumber;
@property (nonatomic,copy) NSArray * titleArray;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation NewsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.dataArray = [[NSMutableArray alloc]init];
    [self creatBaseUI];
}
-(void)getDataHttps{
    NSMutableDictionary * dic0 = [[NSMutableDictionary alloc]init];
    [dic0 setValue:@"体育" forKey:@"channel"];
    [dic0 setValue:@(20) forKey:@"num"];
    [dic0 setValue:@(self.pageNumber) forKey:@"start"];
    [dic0 setValue:@"80d9f207c33a8e4b" forKey:@"appkey"];
    [GetNewsListModel getNewsListParameter:dic0 Succe:^(id succeed) {
        [self.dataArray addObjectsFromArray:(NSArray *)succeed];
        [self.dataTableView reloadData];
        [self.dataTableView.mj_header endRefreshing];
        [self.dataTableView.mj_footer endRefreshing];
    } Fail:^(id failed) {
        [self.dataTableView.mj_header endRefreshing];
        [self.dataTableView.mj_footer endRefreshing];
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
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NewsTableViewCell class])];
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
//    [self.dataTableView.mj_header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    GetNewsListModel * model = self.dataArray[indexPath.row];
    cell.listModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GetNewsListModel * model = self.dataArray[indexPath.row];
    NewsHtmlViewController * html = [[NewsHtmlViewController alloc]init];
    html.listModel = model;
    [self.navigationController pushViewController:html animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
