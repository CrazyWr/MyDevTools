//
//  NSDictionary+toJSON.m
//
//  Created by wei on 16/5/10.
//  Copyright © 2016年 wei. All rights reserved.
//

#import "NSDictionary+toJSON.h"

@implementation NSDictionary (toJSON)

-(NSString *)toJSONString{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error == nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
