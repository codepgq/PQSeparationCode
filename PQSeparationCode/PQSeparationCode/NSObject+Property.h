//
//  NSObject+Property.h
//  KVC
//
//  Created by 盘国权 on 14/6/21.
//  Copyright © 2016年 盘国权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)
//根据字典自动生成属性
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;

@end
