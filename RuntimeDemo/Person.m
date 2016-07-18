//
//  Person.m
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "Person.h"
#import "NSObject+Extension.h"

@implementation Person

- (NSArray *)ignoredNames {
    return @[@"_height"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
       // [self ignoredNames];
        [self decode:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
   // [self ignoredNames];
    [self encode:aCoder];
}

@end
