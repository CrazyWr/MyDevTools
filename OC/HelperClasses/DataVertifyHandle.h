//
//  DataVertifyHandle.h
//
//  Created by wei on 16/4/18.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataVertifyHandle : NSObject

/**
 @brief 正则判断手机号码地址格式

 @param mobileNum
 @return 
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  @brief 验证邮箱格式
 *
 *  @param email 邮箱
 *
 *  @return 真假值
 */
+(BOOL)isValidateEmail:(NSString *)email;

/**
 *  @brief 验证年龄合法性
 *
 *  @param ageString
 *
 *  @return 
 */
+ (BOOL)isAgeNumber:(NSString *)ageString;

/**
 *  @brief 十六进制码验证
 *
 *  @param string
 *
 *  @return
 */
+ (BOOL)isNumberOrCharacters:(NSString *)string;

/**
 @brief 身份证号校验
 
 @param identityString
 @return
 */
+ (BOOL)judgeIdentityStringValid:(NSString *)identityStrin;

@end
