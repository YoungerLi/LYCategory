//
//  UIButton+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LYUtils)

/// Create a button
/// @param image image
+ (UIButton *)buttonWithImage:(UIImage *)image;

/// Create a button
/// @param title title
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
