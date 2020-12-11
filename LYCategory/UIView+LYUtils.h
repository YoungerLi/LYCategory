//
//  UIView+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LYUtils)

#pragma mark - UIView's corner

/// Shortcut to set the view.layer's corner/border
/// @param radius cornerRadius
/// @param color borderColor
/// @param width borderWidth
- (void)setLayerCorner:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width;

/// 设置上边圆角
- (void)setCornerOnTop:(CGFloat)radius;

/// 设置下边圆角
- (void)setCornerOnBottom:(CGFloat)radius;

/// 设置左边圆角
- (void)setCornerOnLeft:(CGFloat)radius;

/// 设置右边圆角
- (void)setCornerOnRight:(CGFloat)radius;

/// 设置左上圆角
- (void)setCornerOnTopLeft:(CGFloat)radius;

/// 设置右上圆角
- (void)setCornerOnTopRight:(CGFloat)radius;

/// 设置左下圆角
- (void)setCornerOnBottomLeft:(CGFloat)radius;

/// 设置右下圆角
- (void)setCornerOnBottomRight:(CGFloat)radius;

/// 设置某些个角的圆角
- (void)setCornerWithCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/// 设置所有圆角
- (void)setAllCorner:(CGFloat)radius;


#pragma mark - HUD

/// 加载中
- (void)showLoading;

/// 加载中，带文字
- (void)showLoadingWith:(nullable NSString *)text;

/// 提示，1.5秒后自动消失
- (void)showTipWith:(nullable NSString *)text;

/// 提示，delay时长后自动消失
- (void)showTipWith:(nullable NSString *)text afterDelay:(NSTimeInterval)delay;

/// 隐藏HUD
- (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
