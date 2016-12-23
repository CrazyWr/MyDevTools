//
//  UIView+Extension.h
//
//  Created by wei on 16/5/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/**
 *  @brief Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat top;

/**
 *  @brief Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 *  @brief Shortcut for frame.origin.x.
 */
@property (nonatomic) CGFloat left;

/**
 *  @brief Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;

- (void)addTarget:(id)target action:(SEL)action;

@end
