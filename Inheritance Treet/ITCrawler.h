//
//  ITCrawler.h
//  Inheritance Treet
//
//  Created by Peter Foti on 11/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITCrawler : NSObject

@property (strong, nonatomic) NSMutableArray *classNamesArray;
- (void)getSuperClassForClassFromString:(NSString *)className;

@end
