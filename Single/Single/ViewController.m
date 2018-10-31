//
//  ViewController.m
//  Single
//
//  Created by MAC on 2018/10/30.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "LvSingleClass.h"
#import "LvOtherSingleClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //单例的优缺点
//    优点
//    1、整个项目中只会实例化一次；
//    2、在整个项目中只实例化一个对象，节省系统内存，提高程序的运行效率
//    缺点
//    1、不能被重写、不能被继承、不能被扩展
//    2、创建单例对象之后，只要程序一直运行就一直占用这系统的内存，在不用该对象的时候也不能销毁消耗着系统的内存
    NSLog(@"---%@----%@",[[LvSingleClass alloc] init], [LvSingleClass sharedSingleClass]);
    
    NSLog(@"---%@----%@",[[LvOtherSingleClass alloc] init], [LvOtherSingleClass sharedSingle]);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
