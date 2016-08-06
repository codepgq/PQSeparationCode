//
//  TableViewModel.m
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

+ (instancetype)tableViewModelWith:(NSDictionary *)dict{
    TableViewModel * model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"] == YES) {
        _ID = value;
    }
}

- (void)setImages:(NSDictionary *)images{
    _images = images[@"small"];
}

@end
