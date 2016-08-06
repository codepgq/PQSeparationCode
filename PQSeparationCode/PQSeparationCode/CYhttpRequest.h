//
//  CYhttpRequest.h
//  NSConnection
//
//  Created by lcy on 15/5/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(id dataObj);
typedef void (^failedBlock)(NSError *error);

@interface CYhttpRequest : NSObject <NSURLConnectionDataDelegate>
{
    NSURLConnection *_conn;
}

@property (nonatomic,strong) NSMutableData *data;

-(id)initWithSuccess:(successBlock)success failed:(failedBlock)failed;

+(void)requestWithUrl:(NSString *)urlStr success:(successBlock)successAction failed:(failedBlock)failedAction;

@end
