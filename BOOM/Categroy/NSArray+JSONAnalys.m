//
//  NSArray+JSONAnalys.m
//  SP2P
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "NSArray+JSONAnalys.h"

@implementation NSArray (JSONAnalys)

+ (NSArray *)JSONAnalysWithObject:(id)obj
{
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }else{
        return [[NSArray alloc] init];
    }
}

@end
