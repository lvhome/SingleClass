//
//  LvOtherSingleClass.h
//  Single
//
//  Created by MAC on 2018/10/31.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LvOtherSingleClass : NSObject
+ (LvOtherSingleClass *)sharedSingle;
+(instancetype) new __attribute__((unavailable("单例类只能初始化一次")));
-(instancetype) copy __attribute__((unavailable("单例类只能初始化一次")));
-(instancetype) mutableCopy  __attribute__((unavailable("单例类只能初始化一次")));
@end
