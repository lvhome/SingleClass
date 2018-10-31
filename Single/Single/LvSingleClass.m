//
//  LvSingleClass.m
//  Single
//
//  Created by MAC on 2018/10/30.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "LvSingleClass.h"

@implementation LvSingleClass
// //详解   问题 因为我们创建了一个单例类，万一有的人使用的时候 不知道这个是单例类 直接使用alloc初始化怎么办
//这样咱们就要做些其它的方法防止一下了  有两种方法
//下面讲下 实现
//　　(1) 为单例对象创建一个静态实例，可以写成全局的，也可以在类方法里面实现，并初始化为nil；
//
//　　(2) 实现一个实例构造方法，检查上面声明的静态实例是否为nil，如果是，则创建并返回一个本类的实例；
//
//　　(3) 重写allocWithZone方法，用来保证其他人直接使用alloc和init试图获得一个新实力的时候不产生一个新实例；
//
//　　(4) 适当实现copyWithZone，mutableCopyWithZone，非arc下还需要实现release和autorelease方法。

static LvSingleClass * singleClass = nil;

+ (LvSingleClass *)sharedSingleClass {
    //可以用synchronized和dispatch_once 个人觉得用后者
    //可以用synchronized
//    @synchronized(self){
//        if (singleClass == nil) {
//            singleClass = [[LvSingleClass alloc]  init];
//        }
//    }
    //可以用dispatch_once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleClass = [[LvSingleClass alloc] init];
    });
    return singleClass;
}

- (id)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleClass = [super init];
    });
    return singleClass;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    if (singleClass == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            singleClass = [super allocWithZone:zone];
        });
    }
    return singleClass;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return singleClass;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return  singleClass;
}

@end
