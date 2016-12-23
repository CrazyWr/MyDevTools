//
//  UIColor+HexColor.h
//
//  Created by wei on 16/4/13.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

/**
 *  @brief 将十六进制的颜色转换成UIColor
 *
 *  @param hexColorString @"FFFFFF"
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;

/**
 *  @brief  将十六进制的颜色转换成UIColor,返回color数组颜色值
 *
 *  @param hexColorString @"FFFFFF"
 *
 *  @return @[r, g, b]
 */
+ (NSArray *)RGBValuecolorWithHexColorString:(NSString *)hexColorString;

@end
