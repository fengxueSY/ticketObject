//
//  SettingViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/16.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingLoginAfterView.h"
#import "UserInfoViewController.h"


@interface SettingViewController ()
@property (nonatomic,copy) NSArray * titleArray;
@property (nonatomic,strong) SettingLoginAfterView * headerView;
@end

@implementation SettingViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:ISLOGIN];
    if (isLogin) {
        self.headerView.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:UserName];
        _titleArray = @[@"修改用户名",@"修改密码",@"退出"];
    }else{
        self.headerView.nameLabel.text = @"登录/注册";
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addUserAction)];
        _titleArray = nil;
        [self.headerView addGestureRecognizer:tap];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self creatBaseUI];
}
-(void)creatBaseUI{
    self.dataTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight)];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    self.dataTableView.backgroundColor = [UIColor blackColor];
    self.dataTableView.tableFooterView = [UIView new];
    self.dataTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:self.dataTableView];
    [self.dataTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SettingTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SettingTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 112;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [UIView new];
    self.headerView.frame = headerView.bounds;
    [headerView addSubview:self.headerView];
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettingTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titleNameLabel.text = _titleArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserInfoViewController * user = [[UserInfoViewController alloc]init];
        user.type = 1;
        user.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:user animated:YES];
    }
    if (indexPath.row == 1) {
        UserInfoViewController * user = [[UserInfoViewController alloc]init];
        user.type = 2;
        user.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:user animated:YES];
    }
    if (indexPath.row == 2) {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:UserName];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:UserPassworf];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:ISLOGIN];
        self.headerView.nameLabel.text = @"登录/注册";
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addUserAction)];
        _titleArray = nil;
        [self.headerView addGestureRecognizer:tap];
        [self viewDidLoad];
    }
}
-(void)addUserAction{
    [WCAlertView showAlertWithTitle:nil message:nil customizationBlock:^(WCAlertView *alertView) {
        
    } completionBlock:^(NSUInteger buttonIndex, WCAlertView *alertView) {
        UserInfoViewController * user = [[UserInfoViewController alloc]init];
        if (buttonIndex == 0) {
            user.type = 3;
            user.title = @"登录";
        }else if (buttonIndex == 1){
            user.type = 0;
            user.title = @"注册";
        }
        [self.navigationController pushViewController:user animated:YES];
    } cancelButtonTitle:@"取消" otherButtonTitles:@"登录",@"注册", nil];
   
}
-(SettingLoginAfterView *)headerView{
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([SettingLoginAfterView class]) owner:self options:0]lastObject];
    }
    return _headerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
