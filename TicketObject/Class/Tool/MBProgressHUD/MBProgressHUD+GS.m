//
//  MBProgressHUD+GS.m
//  RuyueFlyCar
//
//  Created by GentryShen on 16/4/19.
//  Copyright © 2016年 GentryShen. All rights reserved.
//

#import "MBProgressHUD+GS.h"

@implementation MBProgressHUD (GS)

+ (MBProgressHUD *)showAnimationWithMessage:(NSString *)message {
    return [self showAnimationToView:nil withMessage:message];
}

+ (MBProgressHUD *)showAnimationToView:(UIView *)view withMessage:(NSString *)message {
    if (view == nil) view = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;

    hud.offset = CGPointMake(0, -20);
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.f];
    hud.label.text = message;
    hud.label.font = [UIFont systemFontOfSize:12];
    hud.contentColor = UIColorFromRGB(0x22ac38);
    
    
    NSString *strResourcesBundle = [[NSBundle mainBundle] pathForResource:@"RefreshResource" ofType:@"bundle"];
   
    //自定义动画
    UIImageView *gifImageView = [[UIImageView alloc] init];
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i <= 14; i ++) {
        // 找到对应images夹下的图片
        NSString *imgStr = [[NSBundle bundleWithPath:strResourcesBundle] pathForResource:[NSString stringWithFormat:@"bigloading_000%02zd@2x", i] ofType:@"png" inDirectory:@"images"];
        UIImage *image = [UIImage imageWithContentsOfFile:imgStr];
        [arrM addObject:image];
    }
    [gifImageView setAnimationImages:arrM];
    [gifImageView setAnimationDuration:0.75];
    [gifImageView startAnimating];
    
    hud.customView = gifImageView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor whiteColor];
    
    return hud;
}

/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    
    if (view == nil) view = [[[UIApplication sharedApplication] delegate] window];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0f];
    
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success {
    
    [self showSuccess:success toView:nil];
    
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error {
   
  [self showError:error toView:nil];
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error.png" view:view];
}

/**
 *  显示错误信息
 *
 *  @param message 信息内容
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message {

    return [self showMessage:message toView:nil];
    
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    
    if (view == nil) view = [[[UIApplication sharedApplication] delegate] window];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.f];
    
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD {

    [self hideHUDForView:nil];
   
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view {
    
    if (view == nil) view = [[[UIApplication sharedApplication] delegate] window];
    
    [self hideHUDForView:view animated:YES];
    
}
/**
 *  显示1.5秒信息在界面上
 *
 *  @param message 要显示的信息
 */
+(void)showTwoSecondMessage:(NSString *)message toView:(UIView *)view{
    if (view == nil)  {
        view = [[[UIApplication sharedApplication] delegate] window];
    }
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:1.50];
}
@end
