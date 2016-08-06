//
//  NSObject+Property.m
//  KVC
//
//  Created by 盘国权 on 16/6/21.
//  Copyright © 2016年 盘国权. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict{
    
    __block NSMutableString * strM = [NSMutableString string];
    
    //遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        //属性代码
        NSString *code;
        NSLog(@"%@ %@",propertyName,[value class]);
        
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,assign) int %@;",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSDictionary *%@;",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",propertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFConstantString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic,strong) NSString *%@;",propertyName];
        }
        
        [strM appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",strM);
}

@end
