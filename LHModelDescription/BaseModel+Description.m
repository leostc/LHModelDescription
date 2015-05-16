//
//  BaseModel+Description.m
//  LHModelDescription
//
//  Created by lihao-xy on 15/5/15.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import "BaseModel+Description.h"
#import <objc/runtime.h>

@implementation BaseModel (Description)

-(NSString *)description{
    unsigned int numIvars = 0;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:numIvars];
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [[NSString stringWithCString:type encoding:NSUTF8StringEncoding] lowercaseString];
        if ([stringType hasPrefix:@"@"]) {
            id obj = object_getIvar(self, thisIvar);
            if (obj) {
                [dic setObject:obj forKey:key];
            } else {
                [dic setObject:@"nil" forKey:key];
            }
        } else if([stringType hasPrefix:@"f"]) {
            float value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:@(value) forKey:key];
        } else if([stringType hasPrefix:@"d"]) {
            CGFloat value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:@(value) forKey:key];
        } else if([stringType hasPrefix:@"q"]) {
            NSInteger value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:@(value) forKey:key];
        } else if([stringType hasPrefix:@"i"]) {
            int value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:@(value) forKey:key];
        } else if([stringType hasPrefix:@"b"]) {
            BOOL value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:value?@"YES":@"NO" forKey:key];
        } else if([stringType hasPrefix:@"c"]) {
            char value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:[NSString stringWithFormat:@"%c",value] forKey:key];
        } else if([stringType hasPrefix:@"*"]) {
            char* value;
            object_getInstanceVariable(self, ivar_getName(thisIvar), (void*)&value);
            [dic setObject:[NSString stringWithUTF8String:value] forKey:key];
        } else {
            [dic setObject:[NSString stringWithFormat:@"cannott recoginze %@",stringType] forKey:key];
        }
    }
    free(ivars);
    
    return [NSString stringWithFormat:@"<%@ : %p, %@>",
            [self class],
            self,
            dic];
}
@end
