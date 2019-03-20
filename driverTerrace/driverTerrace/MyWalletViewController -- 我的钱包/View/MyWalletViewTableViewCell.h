//
//  MyWalletViewTableViewCell.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/20.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWalletViewTableViewCell : UITableViewCell

@property (nonatomic, weak)IBOutlet UILabel *title;
@property (nonatomic, weak)IBOutlet UILabel *time;
@property (nonatomic, weak)IBOutlet UILabel *price;

@end

NS_ASSUME_NONNULL_END
