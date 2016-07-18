//
//  Person.h
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *age;
@property (nonatomic, copy)NSString *gender;
@property (nonatomic, copy)NSString *height;
@property (nonatomic, copy)NSString *weight;

@end
