//
//  UIColor+LYUtils.m
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "UIColor+LYUtils.h"

@implementation UIColor (LYUtils)

+ (UIColor *)colorWithRandomColor {
    return [self colorWith255Red:arc4random()%256 green:arc4random()%256 blue:arc4random()%256 alpha:1.0];
}

+ (UIColor *)colorWith255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self colorWith255Red:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWith255Red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)lineColor {
    return [UIColor colorWithRGB:0xe5e5e5];
}

+ (UIColor *)textColor {
    return [UIColor colorWithRGB:0x333333];
}

@end
