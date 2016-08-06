//
//  TableViewCell.m
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "TableViewModel.h"
@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *moveNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherLabel;


@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithIem:(TableViewModel * _Nullable )item{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.images]];
    self.moveNameLabel.text = item.title;
    self.otherLabel.text = item.original_title;
}

@end
