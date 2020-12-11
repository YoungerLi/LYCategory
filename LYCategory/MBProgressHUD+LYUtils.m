//
//  MBProgressHUD+LYUtils.m
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "MBProgressHUD+LYUtils.h"

@implementation MBProgressHUD (LYUtils)

+ (void)showLoading {
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
    [self showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
}

+ (void)showLoadingWith:(NSString *)text {
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [self showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.label.text = text;
    }
}

+ (void)showTipWith:(NSString *)text {
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [self showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.numberOfLines = 0;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

+ (void)showTipWith:(NSString *)text afterDelay:(NSTimeInterval)delay {
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [self showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.numberOfLines = 0;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:delay];
    }
}

+ (void)hideHUD {
    [self hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
}

@end
