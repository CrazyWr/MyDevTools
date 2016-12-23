//
//  UIViewController+alertViewManager.m
//
//  Created by wei on 16/4/6.
//  Copyright © 2016年 wei. All rights reserved.
//

#import "UIViewController+alertViewManager.h"

@implementation UIViewController (alertViewManager)

- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle after:(float)time{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];

    [self presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:^{
                
            }];
        });
    }];
    
}

- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle after:(float)time completion:(void (^)(void))completion{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    
    [self presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:completion];
        });
    }];
    
}

- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)alertControllerStyle inputPlaceHolder:(NSString *)placeHolder{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeHolder;
    }];
    [alert addAction:confirm];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

@end
