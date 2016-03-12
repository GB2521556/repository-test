//
//  ViewController.m
//  CopyAndMutableCopyDemo0311
//
//  Created by Mac on 16/3/11.
//  Copyright © 2016年 Water. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    引用计数：为了让使用者清除的知道，该对象有多少拥有者（即有多少个指针指向同一个内存地址）
    
//   iPhone 4S 和 5 是 32 位 ，5S 以上 都是 64 位
//    指针在 32 位 占 4 个字节，在 64 位 占 8 个字节
    
//    NSString *str = nil;
//    NSLog(@"%ld",sizeof(str));
    
    {
        //第一种，非容器类 不可变对象
        NSString *str = [[NSString alloc] initWithFormat:@"hello world"];
        NSString *strCopy = [str copy];
        NSString *strMutableCopy = [str mutableCopy];
        
        NSLog(@"%p : %p : %@",&str,str,str);
        NSLog(@"%p : %p : %@",&strCopy,strCopy,strCopy);
        NSLog(@"%p : %p : %@",&strMutableCopy,strMutableCopy,strMutableCopy);
        
        //总结：copy是浅拷贝，只拷贝内存地址，而mutableCopy是深拷贝，拷贝的是内容
    }
    NSLog(@"————————————————————————————————————————————————————");
    {
        //第二种，非容器类 可变对象
        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"hello world"];
        NSMutableString *strCopy = [str copy];
        NSMutableString *strMutableCopy = [str mutableCopy];
        
        NSLog(@"--%p : %p : %@",&str,str,str);
        NSLog(@"--%p : %p : %@",&strCopy,strCopy,strCopy);
        NSLog(@"--%p : %p : %@",&strMutableCopy,strMutableCopy,strMutableCopy);
        
        //总结：copy 和 mutableCopy 都是深拷贝，拷贝的是内容
    }
    NSLog(@"————————————————————————————————————————————————————");
    {
        //第三种，容器类 不可变对象
//        NSString *str = [[NSString alloc] initWithFormat:@"hello world"];
        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"hello world"];
        NSArray *arr = @[@"1",@"2",str];
        NSArray *arrCopy = [arr copy];
        NSArray *arrMCopy = [arr mutableCopy];
        
        NSLog(@"%p : %p : %@",&arr,arr[2],arr);
        NSLog(@"%p : %p : %@",&arrCopy,arrCopy[2],arrCopy);
        NSLog(@"%p : %p : %@",&arrMCopy,arrMCopy[2],arrMCopy);
        
        //总结：copy是浅拷贝，只拷贝内存地址，而mutableCopy是深拷贝，拷贝的是内容
    }
    
    {
        //第四种，容器类 可变对象
        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"hello world"];
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2",str, nil];
        NSMutableArray *arrCopy = [arr copy];
        NSMutableArray *arrMCopy = [arr mutableCopy];
        
        NSLog(@"%p : %p : %@",&arr,arr[2],arr);
        NSLog(@"%p : %p : %@",&arrCopy,arrCopy[2],arrCopy);
        NSLog(@"%p : %p : %@",&arrMCopy,arrMCopy[2],arrMCopy);
        
        //总结：copy 和 mutableCopy 都是深拷贝，拷贝的是内容
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
