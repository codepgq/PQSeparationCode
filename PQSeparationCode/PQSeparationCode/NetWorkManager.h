//
//  NetWorkManager.h
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

+ (void)dataTaskWith:(NSString *)url completionHandler:(void(^)(NSArray * itemsArray))block;

@end
