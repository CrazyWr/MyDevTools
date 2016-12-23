//
//  NSArray+toJSON.m
//
//  Created by wei on 16/6/2.
//  Copyright © 2016年 wei. All rights reserved.
//

#import "NSArray+toJSON.h"

@implementation NSArray(toJSON)

-(NSString *)toJSONString{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (error == nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
