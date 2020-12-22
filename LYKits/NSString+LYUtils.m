//
//  NSString+LYUtils.m
//  LYKits <https://github.com/YoungerLi/LYKits.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "NSString+LYUtils.h"

@implementation NSString (LYUtils)

/// 返回金额字符串 如:￥100
- (NSString *)moneyString {
    return [NSString stringWithFormat:@"￥%@", self];
}

/// 格式化小数点 如:2.00 = 2, 2.10 = 2.1
- (NSString *)priceString {
    double f = self.doubleValue;
    if (fmod(f, 1) == 0) {
        return [NSString stringWithFormat:@"%.0f", f];
    } else if (fmod(f * 10, 1) == 0) {
        return [NSString stringWithFormat:@"%.1f", f];
    } else {
        return [NSString stringWithFormat:@"%.2f", f];
    }
}

/// 格式化数量（万）
- (NSString *)wanString {
    if (!self) {
        return @"0";
    }
    double d = self.doubleValue;
    if (d < 10000.0) {
        // < 1万
        return self.priceString;
        
    } else if (d < 100000000.0) {
        // 1万 - 1亿
        double b = d / 10000.0;
        NSString *str = [NSString stringWithFormat:@"%f", b];
        return [NSString stringWithFormat:@"%@万", [str substringToIndex:str.length - 5]];

    } else {
        // > 1亿
        double b = d / 100000000.0;
        NSString *str = [NSString stringWithFormat:@"%f", b];
        return [NSString stringWithFormat:@"%@亿", [str substringToIndex:str.length - 5]];
    }
}

/// 姓名脱敏处理
- (NSString *)nameAddStar {
    if (self.length > 1) {
        return [self stringByReplacingOccurrencesOfString:[self substringWithRange:NSMakeRange(0, 1)]
                                               withString:@"*"];
    } else {
        return self;
    }
}

/// 手机号脱敏处理
- (NSString *)phoneAddStar {
    if (self.length <= 4) {
        return self;
    }
    NSString *firstPhone = @"";
    NSString *lastPhone = @"";
    if (self.length <= 8) {
        firstPhone = [self substringToIndex:2];
        lastPhone = [self substringFromIndex:self.length - 2];
    } else {
        firstPhone = [self substringToIndex:3];
        lastPhone = [self substringFromIndex:self.length - 4];
    }
    NSMutableArray *starArray = [[NSMutableArray alloc] init];
    NSInteger starCount = self.length - firstPhone.length - lastPhone.length;
    for (int i = 0; i < starCount; i++) {
        [starArray addObject:@"*"];
    }
    NSString *star = [starArray componentsJoinedByString:@""];
    return [NSString stringWithFormat:@"%@%@%@", firstPhone, star, lastPhone];
}

/// 身份证号脱敏处理
- (NSString *)idCardAddStar {
    if (self.length == 18) {
        return [self stringByReplacingOccurrencesOfString:[self substringWithRange:NSMakeRange(0, 14)]
                                               withString:@"**************"];
    } else {
        return self;
    }
}

/// 银行卡号脱敏处理
- (NSString *)bankCardAddStar {
    if (self.length > 15) {
        return [self stringByReplacingOccurrencesOfString:[self substringWithRange:NSMakeRange(0, self.length - 4)]
                                               withString:@"************"];
    } else {
        return self;
    }
}

/// 手机号有效性
- (BOOL)isPhoneNumber {
    NSString *regex = @"^1\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

/// 判断是不是表情符号
- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex:0];
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex:1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
    } else if (0x2100 <= high && high <= 0x27bf) {
        return YES;
    } else if (0x2B05 <= high && high <= 0x2b07) {
        return YES;
    } else if (0x2934 <= high && high <= 0x2935) {
        return YES;
    } else if (0x3297 <= high && high <= 0x3299) {
        return YES;
    } else {
        if (self.length > 1) {
            const unichar low = [self characterAtIndex:1];
            if (low == 0x20e3) {
                return YES;
            }
        }
    }
    if (high == 0xa9 ||
        high == 0xae ||
        high == 0x303d ||
        high == 0x3030 ||
        high == 0x2b55 ||
        high == 0x2b1c ||
        high == 0x2b1b ||
        high == 0x2b50 ||
        high == 0xd83e) {
        return YES;
    }
    return NO;
}

/// 判断是否包含表情符号
- (BOOL)isContainsEmoji {
    __block BOOL result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    return result;
}

/// 移除表情符号
- (instancetype)removedEmojiString {
    __block NSMutableString *buffer = [NSMutableString stringWithCapacity:[self length]];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              [buffer appendString:[substring isEmoji] ? @"": substring];
                          }];
    return buffer;
}

/// 判断是否包含中文
- (BOOL)isContainChinese {
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

/// 金额字符串插入逗号
- (NSString *)stringByAppendingComma {
    if (!self || self.length == 0) {
        return self;
    }
    NSNumber *number = @([self doubleValue]);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.positiveFormat = @"###.##";
    
    NSString *amountString = [formatter stringFromNumber:number];
    return amountString;
}

@end
