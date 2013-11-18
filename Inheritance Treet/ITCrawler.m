//
//  ITCrawler.m
//  Inheritance Treet
//
//  Created by Peter Foti on 11/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "ITCrawler.h"
#import <objc/runtime.h>

@implementation ITCrawler

#pragma Properties
- (NSMutableArray *)classNamesArray
{
    return _classNamesArray = _classNamesArray ?: [NSMutableArray array];
}

#pragma Methods
- (void)getSuperClassForClassFromString:(NSString *)className
{
    if (className) {
        [self.classNamesArray addObject:[NSString stringWithFormat:@"%@", className]];
        Class superClass = class_getSuperclass(NSClassFromString(className));
        if (superClass) {
            [self getSuperClassForClassFromString:NSStringFromClass(superClass)];
        }
    } else {
        NSLog(@"Not a valid class: %@", className);
    }
}

@end
