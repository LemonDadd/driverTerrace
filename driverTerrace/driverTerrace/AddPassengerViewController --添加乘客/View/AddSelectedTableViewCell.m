//
//  AddSelectedTableViewCell.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AddSelectedTableViewCell.h"

@implementation AddSelectedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _leftLabel = [UILabel new];
        [self.contentView addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(@15);
        }];
        
        
        _dropdownListView = [EBDropdownListView new];
        [_dropdownListView setViewBorder:0.5 borderColor:[UIColor grayColor] cornerRadius:5];
        [self.contentView addSubview:_dropdownListView];
//        _selectedView = [HWDownSelectedView new];
//        _selectedView.placeholder = @"请选择";
//        [self.contentView addSubview:_selectedView];
        [_dropdownListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@40);
            make.left.equalTo(self.contentView.mas_centerX);
        }];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
