//
//  ViewController.m
//  LHModelDescription
//
//  Created by lihao-xy on 15/5/15.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import "ViewController.h"
#import "BaseModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BaseModel *model = [[BaseModel alloc]init];
    NSLog(@"%@",model);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
