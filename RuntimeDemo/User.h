//
//  User.h
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

@interface User : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)double age;
@property (nonatomic, copy)NSString *height;
@property (nonatomic, copy)NSString *money;

//属性是一个对象
@property (nonatomic, strong)Cat *cat;
//属性是一个数组
@property (nonatomic, strong)NSArray *books;

@end
