//
//  MBProgressHUD+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (LYUtils)

/// 加载中
+ (void)showLoading;

/// 加载中，带文字
+ (void)showLoadingWith:(nullable NSString *)text;

/// 提示，1.5秒后自动消失
+ (void)showTipWith:(nullable NSString *)text;

/// 提示，delay时长后自动消失
+ (void)showTipWith:(nullable NSString *)text afterDelay:(NSTimeInterval)delay;

/// 隐藏HUD
+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
