//
//  NSDictionary+LYUtils.m
//  LYKits <https://github.com/YoungerLi/LYKits.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import "NSDictionary+LYUtils.h"

@implementation NSDictionary (LYUtils)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    if (error) {
        NSLog(@"json解析失败：%@", error);
        return nil;
    }
    return dic;
}

@end
