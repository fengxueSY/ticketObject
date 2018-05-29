//
//  UserInfoViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (weak, nonatomic) IBOutlet UILabel *oneLable;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UITextField *oneTextfield;
@property (weak, nonatomic) IBOutlet UITextField *twoTextfield;
@property (weak, nonatomic) IBOutlet UITextField *threeTextField;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;

    [self creatBaseUI];
}
-(void)creatBaseUI{
    self.oneTextfield.delegate = self;
    self.twoTextfield.delegate = self;
    self.threeTextField.delegate = self;
    [self.enterButton.layer setMasksToBounds:YES];
    [self.enterButton.layer setCornerRadius:10];
    self.enterButton.tag = self.type;
    [self.enterButton addTarget:self action:@selector(addUser:) forControlEvents:UIControlEventTouchUpInside];
    switch (self.type) {
        case 0://注册
        {
            self.oneLable.text = @"请输入用户名";
            self.twoLabel.text = @"请输入密码";
            self.threeLabel.text = @"请再次输入密码";
            [self.twoTextfield setSecureTextEntry:YES];
            [self.threeTextField setSecureTextEntry:YES];
        }
            break;
        case 1://修改用户名
        {
            self.oneLable.text = @"请输入旧用户名";
            self.twoLabel.text = @"请输入新用户名";
            self.threeLabel.text = @"请再次输入新用户名";
        }
            break;
        case 2://修改密码
        {
            self.oneLable.text = @"请输入旧密码";
            self.twoLabel.text = @"请输入新密码";
            self.threeLabel.text = @"请再次输入新密码";
        }
            break;
        case 3://登录
        {
            self.oneLable.text = @"请输入旧密码";
            self.twoLabel.text = @"请输入新密码";
            self.threeLabel.hidden = YES;
            self.threeTextField.hidden = YES;
        }
            break;
        default:
            break;
    }
}
//注册
-(void)addUser:(UIButton *)sender{
    if (self.oneTextfield.text == nil || self.twoTextfield.text == nil || self.threeTextField.text == nil) {
        return;
    }
    switch (sender.tag) {
        case 0:
        {
            if (![self.twoTextfield.text isEqualToString:self.threeTextField.text]) {
                [MBProgressHUD showError:@"密码不一致，请重新输入"];
                return;
            }
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:ISLOGIN];
            [[NSUserDefaults standardUserDefaults]setValue:self.oneTextfield.text forKey:UserName];
            [[NSUserDefaults standardUserDefaults]setValue:self.twoTextfield.text forKey:UserPassworf];
            [[NSUserDefaults standardUserDefaults]synchronize];
            BmobObject *gameScore = [BmobObject objectWithClassName:BMOBUSER];
            [gameScore setObject:self.oneTextfield.text forKey:@"username"];
            [gameScore setObject:self.twoTextfield.text forKey:@"password"];
            [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                if (isSuccessful) {
                    [MBProgressHUD showSuccess:@"创建成功"];
                    [self.navigationController popViewControllerAnimated:YES];
                    NSLog(@"添加成功");
                }else{
                    NSLog(@"添加失败");
                }
            }];
        }
            break;
        case 1:
        {
            if (![self.twoTextfield.text isEqualToString:self.threeTextField.text]) {
                [MBProgressHUD showError:@"新用户名不一致，请重新输入"];
                return;
            }
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:ISLOGIN];
            [[NSUserDefaults standardUserDefaults]setValue:self.twoTextfield.text forKey:UserName];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [MBProgressHUD showSuccess:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 2:
        {
            if (![self.twoTextfield.text isEqualToString:self.threeTextField.text]) {
                [MBProgressHUD showError:@"密码不一致，请重新输入"];
                return;
            }
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:ISLOGIN];
            [[NSUserDefaults standardUserDefaults]setValue:self.twoTextfield.text forKey:UserPassworf];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [MBProgressHUD showSuccess:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 3://登录
        {
            NSString * name = [[NSUserDefaults standardUserDefaults]objectForKey:UserName];
            NSString * password = [[NSUserDefaults standardUserDefaults]objectForKey:UserPassworf];
            if (![self.oneTextfield.text isEqualToString:name] || ![self.twoTextfield.text isEqualToString:password]) {
                [MBProgressHUD showError:@"账号或密码不正确，请重新输入"];
                return;
            }
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:ISLOGIN];
            [[NSUserDefaults standardUserDefaults]setValue:self.oneTextfield.text forKey:UserName];
            [[NSUserDefaults standardUserDefaults]setValue:self.twoTextfield.text forKey:UserPassworf];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [MBProgressHUD showSuccess:@"登录成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        default:
            break;
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.oneTextfield resignFirstResponder];
    [self.twoTextfield resignFirstResponder];
    [self.threeTextField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.oneTextfield resignFirstResponder];
    [self.twoTextfield resignFirstResponder];
    [self.threeTextField resignFirstResponder];
    return YES;
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
