//
//  UIApplication+Extensions.h
//
//  Created by wei on 16/5/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface UIApplication (Extensions)

/**
 * @brief 返回应用程序代理
 */
+ (AppDelegate *)appDelegate;


/**
 *  @breif 根视图控制器
 */
+ (UIViewController *)rootViewController;

/**
 *  @brief 返回当前设备对应的启动图片
 */
+ (UIImage *)launchImage;


/**
 @brief 返回当前显示的VC
 @return CurrentVC
 */
+ (UIViewController *)currentVC;

@end
