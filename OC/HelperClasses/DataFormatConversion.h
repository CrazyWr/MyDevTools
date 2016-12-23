//
//  DataFormatConversion.h
//
//  Created by wei on 16/8/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFormatConversion : NSObject

/**
 *  @brief 10进制转16进制字符串
 *
 *  @param tmpid 10进制数
 *
 *  @return 16进制String
 */
+ (NSString *)ToHex:(int)tmpid;

/**
 *  @brief 通过前3个数据生成第四个校验数据,并返回新数据数组
 *         @[1, 2, 3] -> @[1 ,2, 3, (抑或校验+和校验)]
 *
 *  @param array 原数组
 *
 *  @return 带校验值的新数组
 */
+ (NSArray *)verifyOrderData:(NSArray *)array;

#pragma mark - HexString <--> NSData
/**
 *  @brief 将十六进制字符串转化成NSData 最多20字节
 *
 *  @param hexString 十六进制字符串
 *  @param length    长度
 *
 *  @return NSData
 */
+ (NSData *)hexString:(NSString *)hexString length:(int)length;

/**
 *  @brief NSData - > HexString
 *
 *  @param data <#data description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)hexStringFromData:(NSData *)data;

/**
 *  @brief data转换成NSNumner数组
 *
 *  @param data
 *
 *  @return
 */
+ (NSArray *)arrayFromData:(NSData *)data;


/**
 *  @brief 低8位和高8位转换
 *
 *  @param data
 *
 *  @return
 */
+ (NSData *)dataExchangeLowHight:(NSData *)data;


/**
 @brief 将十六进制字符串转成int

 @param hex

 @return
 */
+ (unsigned long)intergerFromHexString:(NSString *)hex;

@end
