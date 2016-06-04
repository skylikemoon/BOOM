//
//  NSDictionary+JSONAnalys.m
//  SP2P
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "NSDictionary+JSONAnalys.h"

@implementation NSDictionary (JSONAnalys)

+ (NSDictionary *)JSONAnalysWithObject:(id)obj
{
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }else{
        return [[NSDictionary alloc] init];
    }
}

@end
