//
//  ViewController.m
//  WhatTheHellIsBlock
//
//  Created by wen zhang on 2017/5/17.
//  Copyright © 2017年 Gwen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 定义block
    void (^helloBlock)() = ^ {
        printf("hello");
    };
    // 调用block
    helloBlock();
    
    // 带参数的block
    int mutiplier = 3;
    int (^caculateBlock)(int) = ^(int num) {
        return num * mutiplier;
    };
    NSLog(@"%d", caculateBlock(11));
    
    // 带参数的block
    // why do i need __block here?
    // block 在实现时就会对它引用到它的外部栈变量进行一次拷贝 并且是只读的
    // 这里我们想要修改只读的东西 所以会报错
    // 这里我们用__block修饰符来修饰外部变量, 相当于告诉编译器 我这个变量你不需要被内存拷贝了 , 是指的同一块内存
    __block int mutiplier1 = 3;
    int (^caculateBlock1)(int) = ^(int num) {
        mutiplier1 = num * mutiplier1;
        return mutiplier1;
    };
    NSLog(@"%d", caculateBlock1(11));
    
    
    // weak-strong dance
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
