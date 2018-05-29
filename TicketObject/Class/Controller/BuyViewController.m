//
//  BuyViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyTableViewCell.h"
#import "GetTicketListModel.h"
#import "BuyDetailsViewController.h"

@interface BuyViewController ()
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) NSArray * imageArray;
@end

@implementation BuyViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.dataArray = [[NSMutableArray alloc]init];
    self.imageArray = @[@"125_74_双色球",@"125_74大乐透",@"125_74福彩3d",@"125_74排列三",@"125_74排列五",@"125_74七彩乐",@"125_74七星彩"];
    [self getHttpsData];
    [self creatBaseUI];
}
-(void)getHttpsData{
    __weak typeof(self) wself = self;
    [GetTicketListModel getTicketListSucceed:^(id succeed) {
        __strong typeof(wself) sself = wself;
        sself.dataArray = (NSMutableArray *)succeed;
        [sself.dataTableView reloadData];
    } Fail:^(id failed) {
        NSLog(@"%@", failed);
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
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BuyTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([BuyTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BuyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BuyTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.headerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[indexPath.row]]];
    GetTicketListModel * model = self.dataArray[indexPath.row];
    cell.listModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GetTicketListModel * model = self.dataArray[indexPath.row];
    BuyDetailsViewController * buy = [[BuyDetailsViewController alloc]init];
    buy.listModel = model;
    [self.navigationController pushViewController:buy animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
