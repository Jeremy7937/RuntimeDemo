//
//  UIImage+Category.m
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

@implementation UIImage (Category)

char nameKey;

+ (UIImage *)gk_imageNamed:(NSString *)name {
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        //如果系统版本是7.0以上，使用另一套图片
        name = [name stringByAppendingString:@"_os7"];
    }
    return [UIImage gk_imageNamed:name];
}

+ (void)load {
    //获取到两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(gk_imageNamed:));
    //交换方法实现
    method_exchangeImplementations(m1, m2);
}

- (void)setName:(NSString *)name {
    //将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, &nameKey);
}

@end
