//
//  UILabel+LYUtils.m
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "UILabel+LYUtils.h"

@implementation UILabel (LYUtils)

+ (UILabel *)labelWithColor:(UIColor *)color font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color ?: [UIColor blackColor];
    label.font = font ?: [UIFont systemFontOfSize:15];
    return label;
}

- (void)setLineSpacing:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    self.attributedText = attributedString;
}

@end
