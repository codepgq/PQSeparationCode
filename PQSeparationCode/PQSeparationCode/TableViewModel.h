//
//  TableViewModel.h
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewModel : NSObject

@property (nonatomic,strong) NSDictionary *rating;

@property (nonatomic,strong) NSString * ID;

@property (nonatomic,strong) NSString *original_title;

@property (nonatomic,assign) int collect_count;

@property (nonatomic,strong) NSArray *directors;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *year;

@property (nonatomic,strong) NSArray *casts;

@property (nonatomic,strong) NSArray *genres;

@property (nonatomic,strong) NSString *images;

@property (nonatomic,strong) NSString *subtype;

@property (nonatomic,strong) NSString *alt;

+ (instancetype)tableViewModelWith:(NSDictionary *)dict;

@end
