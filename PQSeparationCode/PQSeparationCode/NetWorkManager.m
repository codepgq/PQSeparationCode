//
//  NetWorkManager.m
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworking.h"
#import "TableViewModel.h"
#import "NSObject+Property.h"
@implementation NetWorkManager

+ (void)dataTaskWith:(NSString *)url completionHandler:(void(^)(NSArray * itemsArray))block{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSDictionary * dict = (NSDictionary *)responseObject;
        NSMutableArray * array = [NSMutableArray array];
        NSArray * objects = dict[@"subjects"];
        for (NSDictionary * dict in objects) {
            [array addObject:[TableViewModel tableViewModelWith:dict]];
        }
        if (block) {
            block(array);
        }
    }];
    [dataTask resume];
}

@end
