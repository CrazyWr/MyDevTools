//
//  UIApplication+Extensions.m
//
//  Created by wei on 16/5/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import "UIApplication+Extensions.h"

@implementation UIApplication (Extensions)

+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

+ (UIViewController *)rootViewController {
    return [UIApplication appDelegate].window.rootViewController;
}

+ (UIImage *)launchImage {
    UIImage *image = nil;
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    for (NSDictionary *dict in launchImages) {
        // 1. 将字符串转换成尺寸
        CGSize size = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        // 2. 与当前屏幕进行比较
        if (CGSizeEqualToSize(size, [UIScreen ff_screenSize])) {
            NSString *filename = dict[@"UILaunchImageName"];
            image = [UIImage imageNamed:filename];
            
            break;
        }
    }
    return image;
}

+ (UIViewController *)currentVC{
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController * currVC = nil;
    UIViewController * Rootvc = window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }else if ([Rootvc isKindOfClass:[UIViewController class]]){
            UIViewController * tabVC = (UIViewController *)Rootvc;
            currVC = tabVC;
            Rootvc = tabVC.presentedViewController;
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
    
}

@end
