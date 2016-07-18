//
//  UIImage+Category.h
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

@property (nonatomic, copy)NSString *name;

+ (UIImage *)gk_imageNamed:(NSString *)name;

@end
