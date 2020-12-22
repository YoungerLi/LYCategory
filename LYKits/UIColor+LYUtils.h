//
//  UIColor+LYUtils.h
//  LYKits <https://github.com/YoungerLi/LYKits.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LYUtils)

/// 随机颜色
+ (UIColor *)colorWithRandomColor;

/// 普通的255颜色转换
+ (UIColor *)colorWith255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWith255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
