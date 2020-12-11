//
//  NSDate+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LYUtils)

#pragma mark - Component Properties

/// 是否是前天
@property (nonatomic, readonly) BOOL isBeforeYesterday;


#pragma mark - Date Format

/// 时间描述（几分钟前/几小时前/昨天/前天/2020-03-16）
- (NSString *)dateDescription;

@end

NS_ASSUME_NONNULL_END
