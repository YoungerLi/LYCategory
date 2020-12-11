//
//  NSString+LYUtils.h
//  LYCategory <https://github.com/YoungerLi/LYCategory.git>
//
//  Created by 李杨 on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LYUtils)

/**
 返回金额字符串 如:￥100
*/
- (nullable NSString *)moneyString;

/**
 格式化小数点 如:2.00 = 2, 2.10 = 2.1
*/
- (nullable NSString *)priceString;

/**
 格式化数量（万）
*/
- (NSString *)wanString;

/**
 姓名脱敏处理
*/
- (nullable NSString *)nameAddStar;

/**
 手机号脱敏处理
*/
- (nullable NSString *)phoneAddStar;

/**
 身份证号脱敏处理
 */
- (nullable NSString *)idCardAddStar;

/**
 银行卡号脱敏处理
 */
- (nullable NSString *)bankCardAddStar;

/**
 手机号有效性
*/
- (BOOL)isPhoneNumber;

/**
 判断是不是表情符号
 */
- (BOOL)isEmoji;

/**
 判断是否包含表情符号
 */
- (BOOL)isContainsEmoji;

/**
 移除表情符号
 */
- (instancetype)removedEmojiString;

/**
 判断是否包含中文
 */
- (BOOL)isContainChinese;

/**
 金额字符串插入逗号
 */
- (NSString *)stringByAppendingComma;

@end

NS_ASSUME_NONNULL_END
