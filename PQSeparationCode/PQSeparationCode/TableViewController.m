//
//  TableViewController.m
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "TableViewController.h"
#import "PQTBDataSource.h"
#import "TableViewCell.h"
#import "NetWorkManager.h"
#define URL @"https://api.douban.com/v2/movie/top250?start=0&count=10"
@interface TableViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property (nonatomic,strong) PQTBDataSource * dataSouce;
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation TableViewController

static  NSString * const CELLIDENTIFIER = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSouce = [PQTBDataSource dataSourceWith:_dataArray identifier:CELLIDENTIFIER cellConfigBlock:^(TableViewCell * _Nullable cell, id  _Nullable item) {
        [cell configCellWithIem:item];
    }];
    self.myTableView.dataSource = self.dataSouce;
    [self.myTableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:CELLIDENTIFIER];
    
    typeof(self) weakSelf = self;
    [NetWorkManager dataTaskWith:URL completionHandler:^(NSArray *itemsArray) {
        [weakSelf.dataSouce pq_updateWithArray:itemsArray];
        [weakSelf.myTableView reloadData];
    }];
        
}



@end
