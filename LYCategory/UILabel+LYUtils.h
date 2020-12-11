//
//  UILabel+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LYUtils)

/// 创建一个UILabel
/// @param color 字体颜色 默认blackColor
/// @param font 字体大小 默认15
+ (UILabel *)labelWithColor:(nullable UIColor *)color font:(nullable UIFont *)font;

/// 设置行间距
/// @param space 行间距
- (void)setLineSpacing:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
