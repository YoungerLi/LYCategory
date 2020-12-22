//
//  NSDictionary+LYUtils.h
//  LYKits <https://github.com/YoungerLi/LYKits.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LYUtils)

/// json字符串转字典
/// @param jsonString json字符串
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
