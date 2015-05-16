//
//  Model1.m
//  LHModelDescription
//
//  Created by lihao-xy on 15/5/16.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import "Model1.h"

@interface Model1() {
    NSString *_str;
}

@property (strong, nonatomic) NSDictionary *dic;
@property (strong, nonatomic) NSArray *arr;

@property (assign, nonatomic) CGFloat varCGFloat;
@property (assign, nonatomic) BOOL varBool;
@property (assign, nonatomic) float varFloat;
@property (assign, nonatomic) double varDouble;
@property (assign, nonatomic) int varInt;
@property (assign, nonatomic) NSInteger varInterger;
@property (assign, nonatomic) unsigned varUnsinged;
@property (assign, nonatomic) long varLong;
@property (assign, nonatomic) char varChar;
@property (assign, nonatomic) char* varCharP;

@end

@implementation Model1

-(instancetype)init{
    if (self = [super init]) {
        _str = @"appledev.me";
        _dic = @{@"1":@"this",
                 @"2":@"is",
                 @"3":@"a test"};
        _arr = @[@"more",@"infomation",@"in",@"appledev.me"];
        _varInt = 100;
        _varBool = YES;
        _varLong = 1100000l;
        _varFloat = 2.01;
        _varDouble = 3.123123;
        _varCGFloat = 4.123123;
        _varInterger = 1231;
        _varUnsinged = 123;
        _varChar = 'a';
        _varCharP = "appledev.me";
    }
    return self;
}


@end
