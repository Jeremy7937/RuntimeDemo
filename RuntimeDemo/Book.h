//
//  Book.h
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *publisher;
@property (nonatomic, assign)double price;

@end
