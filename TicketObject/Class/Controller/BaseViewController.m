//
//  BaseViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/16.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.baseLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.baseLeftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    self.baseLeftButton.frame = CGRectMake(0, 0, 40, 35);
    [self.baseLeftButton addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.baseLeftButton];
    if ([self isEqual:[self.navigationController.viewControllers objectAtIndex:0]]) {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
        self.tabBarController.tabBar.hidden = NO;
    }else{
        self.tabBarController.tabBar.hidden = YES;
    }
}
- (void)goBackAction{
    [self.navigationController popViewControllerAnimated:YES];
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
