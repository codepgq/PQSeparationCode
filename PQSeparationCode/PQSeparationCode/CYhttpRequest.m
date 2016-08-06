//
//  CYhttpRequest.m
//  NSConnection
//
//  Created by lcy on 15/5/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CYhttpRequest.h"

@implementation CYhttpRequest
{
    successBlock _success;
    failedBlock _failed;
}

- (id)initWithSuccess:(successBlock)success failed:(failedBlock)failed
{
    self = [super init];
    if (self) {
        self.data = [[NSMutableData alloc] init];
        _success = success;
        _failed = failed;
    }
    return self;
}

-(void)startRequset:(NSString *)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    _conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
}

+(void)requestWithUrl:(NSString *)urlStr success:(successBlock)successAction failed:(failedBlock)failedAction
{
    CYhttpRequest *request = [[CYhttpRequest alloc] initWithSuccess:successAction failed:failedAction];
    
    [request startRequset:urlStr];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(_failed != nil)
    {
        _failed(error);
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data.length = 0;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if(_success != nil)
    {
        _success(self.data);
    }
}

@end
