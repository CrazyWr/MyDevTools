//
//  UIViewController+alertViewManager.h
//
//  Created by wei on 16/4/6.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (alertViewManager)

/**
 *  @brief 延时time消失的alertController
 *
 *  @param title                标题
 *  @param message              信息
 *  @param alertControllerStyle 样式
 *  @param time                 延时时间
 */
- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle after:(float)time;

/**
 *  @brief 带block块的延时time消失的alertController
 *
 *  @param title
 *  @param message
 *  @param alertControllerStyle
 *  @param time
 *  @param completion
 */
- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle after:(float)time completion:(void (^)(void))completion;

/**
 *  @brief 带输入框的alertController
 *
 *  @param title
 *  @param message               
 *  @param alertCopntrollerStyle 
 *  @param placeHolder           
 */
- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle inputPlaceHolder:(NSString *)placeHolder;

@end
