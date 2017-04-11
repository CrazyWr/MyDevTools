//
//  NSString+Encryption.h
//
//
//  Created by wei on 2017/4/11.
//  Copyright © 2017年 wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

//MD5
+ (NSString *) md5:(NSString *)str;

//Base64
+ (NSString *)base64StringFromText:(NSString *)text;
+ (NSString *)textFromBase64String:(NSString *)base64;
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

//DES加密
+(NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)iv;

//DES解密
+(NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;

//3DES加密
+ (NSString *)encrypt3DesSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)iv;

//字符串3DES解密
+(NSString *)decryptWith3DESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;

//AES128加密
+ (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;

//AES128解密
+ (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;


@end
