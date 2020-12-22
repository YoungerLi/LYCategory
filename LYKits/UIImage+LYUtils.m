//
//  UIImage+LYUtils.m
//  LYKits <https://github.com/YoungerLi/LYKits.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "UIImage+LYUtils.h"

@implementation UIImage (LYUtils)

/// 通过文件路径加载图片
+ (UIImage *)imageWithName:(NSString *)imgName {
    if (imgName) {
        NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        return image;
    }
    return nil;
}

/// 根据UIView生成一个图片
+ (UIImage *)imageWithView:(UIView *)view {
    CGSize size = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
