//
//  NSDate+LYUtils.m
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "NSDate+LYUtils.h"

@implementation NSDate (LYUtils)

- (NSString *)dateDescription {
    if (self.isToday) {
        // 今天
        NSTimeInterval timeInterval = fabs(self.timeIntervalSinceNow);
        if (timeInterval < 60) {
            return @"刚刚";
        } else if (timeInterval < 60 * 59.5) {
            return [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
        } else {
            return [NSString stringWithFormat:@"%.f小时前", timeInterval / 60 / 60];
        }
    } else if (self.isYesterday) {
        // 昨天
        return @"昨天";
        
    } else if ([self isBeforeYesterday]) {
        // 前天
        return @"前天";
        
    } else {
        // 前天以前
        return [self stringWithFormat:@"yyyy-MM-dd"];
    }
}

/// 是否是前天
- (BOOL)isBeforeYesterday {
    NSDate *date = [self dateByAddingDays:2];
    return [date isToday];
}

@end
