//
//  RouteDetailTopTableViewCell.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouteDetailTopTableViewCell : UITableViewCell

@property (nonatomic, weak)IBOutlet UILabel *sitLabel;
@property (nonatomic, weak)IBOutlet UILabel *priceLabel;
@property (nonatomic, weak)IBOutlet UILabel *timeLabel;
@property (nonatomic, weak)IBOutlet UILabel *rightLabel;

@end

NS_ASSUME_NONNULL_END
