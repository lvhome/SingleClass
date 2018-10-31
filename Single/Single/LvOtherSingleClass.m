//
//  LvOtherSingleClass.m
//  Single
//
//  Created by MAC on 2018/10/31.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "LvOtherSingleClass.h"

@implementation LvOtherSingleClass
static LvOtherSingleClass * singleClass = nil;

+ (LvOtherSingleClass *)sharedSingle {
    //可以用synchronized和dispatch_once 个人觉得用后者
    //可以用synchronized
    //    @synchronized(self){
    //        if (singleClass == nil) {
    //            singleClass = [[LvOtherSingleClass alloc]  init];
    //        }
    //    }
    //可以用dispatch_once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleClass = [[LvOtherSingleClass alloc] init];
    });
    return singleClass;
}

+(void)initialize
{
    [LvOtherSingleClass sharedSingle];
}

+ (instancetype)alloc
{
    //如果已经初始化了
    if(singleClass)
    {
        return  singleClass;
    }
    
    return [super alloc];
}

@end
