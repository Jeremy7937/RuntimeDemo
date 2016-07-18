//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 郭凯 on 16/7/14.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Category.h"
#import "Person.h"
#import <objc/runtime.h>
#import "NSObject+Extension.h"
#import "NSObject+JSONExtension.h"
#import "User.h"
#import "Book.h"
#import "Cat.h"
#import "Fish.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end

@implementation ViewController
{
    UIImage *_image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.拦截系统的方法
    _image = [UIImage imageNamed:@"clearCache"];
    self.iconImageView.image = _image;
    
    //2.runtime 为分类添加成员变量
    _image.name = @"清除缓存";
    NSLog(@"_______image.name:%@",_image.name);
    
    //3.获取Person类中所有成员变量的名字和类型 const 修饰常量 
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名:%s 成员变量类型:%s",name,type);
    }
    //释放内存
    free(ivars);
    
    //4.对person类进行解归档
    Person *p = [[Person alloc] init];
    p.name = @"guokai";
    p.gender = @"男";
    p.age = @"23";
    p.weight = @"60kg";
    p.height = @"173cm";
   // [p ignoredNames];
    
    //归档
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:p forKey:@"person"];
    [archiver finishEncoding];
    
    [data writeToFile:[self getObjFilePath] atomically:YES];
    
    //解档
    NSMutableData *mData = [NSMutableData dataWithContentsOfFile:[self getObjFilePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:mData];
    Person *p2 = [unarchiver decodeObjectForKey:@"person"];
    NSLog(@"name:%@   gender:%@   age:%@   height:%@   weight:%@",p2.name,p2.gender,p2.age,p2.height,p2.weight);
    [self json];
}

- (NSString *)getObjFilePath {
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/text.plist",NSHomeDirectory()];
    NSLog(@"____filePath:%@",filePath);
    return filePath;
}

- (void)json {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    User *user = [User objectWithDict:json];
    
    Cat *cat = user.cat;
    Fish *fish = cat.fish;
    
    NSLog(@"______name:%@",fish.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
