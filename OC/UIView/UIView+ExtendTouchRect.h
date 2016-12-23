//
//  UIView+ExtendTouchRect.h
//  ExtendTouchRectDemo
//
//  Created by wei on 2016/12/22.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExtendTouchRect)


/**
 @brief extend touch rect of view 
        eg. view.touchExtendInset = UIEdgeInsetsMake(-10, -10, -10, -10);
 */
@property (assign, nonatomic) UIEdgeInsets touchExtendInset;

@end
