//
//  MBProgressHUD+GS.h
//  RuyueFlyCar
//
//  Created by GentryShen on 16/4/19.
//  Copyright © 2016年 GentryShen. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GS)
+ (MBProgressHUD *)showAnimationWithMessage:(NSString *)message;
+ (MBProgressHUD *)showAnimationToView:(UIView *)view withMessage:(NSString *)message;
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

/**
 *  显示1.5秒信息在界面上
 *
 *  @param message 显示的信息
 *  @param view    在哪个view上，如果穿nil，默认在window上
 */
+ (void)showTwoSecondMessage:(NSString *)message toView:(UIView *)view;

@end
