//
//  NSObject+JSONExtension.h
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtension)

- (void)setDict:(NSDictionary *)dict;

+ (instancetype)objectWithDict:(NSDictionary *)dict;

//告诉数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass;

@end
