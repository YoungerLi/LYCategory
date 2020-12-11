//
//  UIView+LYUtils.m
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "UIView+LYUtils.h"

@implementation UIView (LYUtils)

- (void)setLayerCorner:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)setCornerOnTop:(CGFloat)radius {
    [self setCornerWithCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) radius:radius];
}

- (void)setCornerOnBottom:(CGFloat)radius {
    [self setCornerWithCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) radius:radius];
}

- (void)setCornerOnLeft:(CGFloat)radius {
    [self setCornerWithCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) radius:radius];
}

- (void)setCornerOnRight:(CGFloat)radius {
    [self setCornerWithCorners:(UIRectCornerTopRight | UIRectCornerBottomRight) radius:radius];
}

- (void)setCornerOnTopLeft:(CGFloat)radius {
    [self setCornerWithCorners:UIRectCornerTopLeft radius:radius];
}

- (void)setCornerOnTopRight:(CGFloat)radius {
    [self setCornerWithCorners:UIRectCornerTopRight radius:radius];
}

- (void)setCornerOnBottomLeft:(CGFloat)radius {
    [self setCornerWithCorners:UIRectCornerBottomLeft radius:radius];
}

- (void)setCornerOnBottomRight:(CGFloat)radius {
    [self setCornerWithCorners:UIRectCornerBottomRight radius:radius];
}

- (void)setCornerWithCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setAllCorner:(CGFloat)radius {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:radius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)showLoading {
    [MBProgressHUD hideHUDForView:self animated:NO];
    [MBProgressHUD showHUDAddedTo:self animated:YES];
}

- (void)showLoadingWith:(NSString *)text {
    [MBProgressHUD hideHUDForView:self animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.label.text = text;
    }
}

- (void)showTipWith:(NSString *)text {
    [MBProgressHUD hideHUDForView:self animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.numberOfLines = 0;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

- (void)showTipWith:(NSString *)text afterDelay:(NSTimeInterval)delay {
    [MBProgressHUD hideHUDForView:self animated:NO];
    if ([text isNotBlank]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.numberOfLines = 0;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:delay];
    }
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

@end
