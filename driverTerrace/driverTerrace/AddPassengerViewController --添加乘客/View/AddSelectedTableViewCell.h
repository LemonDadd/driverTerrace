//
//  AddSelectedTableViewCell.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EBDropdownListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddSelectedTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *leftLabel;
//@property (nonatomic, strong)HWDownSelectedView *selectedView;
@property (nonatomic, strong)EBDropdownListView *dropdownListView;
@end

NS_ASSUME_NONNULL_END
