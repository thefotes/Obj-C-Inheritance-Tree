//
//  ITCrawler.m
//  Inheritance Treet
//
//  Created by Peter Foti on 11/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "ITCrawler.h"
#import <objc/runtime.h>

@interface ITCrawler()

@property (strong, nonatomic) NSMutableArray *classNamesArray;

@end
@implementation ITCrawler

#pragma Properties
- (NSMutableArray *)classNamesArray
{
    return _classNamesArray = _classNamesArray ?: [NSMutableArray array];
}

#pragma Methods
- (NSArray *)getSuperClassForClassFromString:(NSString *)className
{
    Class superClass = class_getSuperclass(NSClassFromString(className));
    [self.classNamesArray addObject:[NSString stringWithFormat:@"%@", className]];
    
    if (superClass) {
        [self getSuperClassForClassFromString:NSStringFromClass(superClass)];
    }

    return [NSArray arrayWithArray:self.classNamesArray];
    

}

@end
