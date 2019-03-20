//
//  CityViewController.h
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Citytype) {
    CitytypeFrom,
    CitytypeTo,
};

@interface CityViewController : BaseViewController

@property (nonatomic, assign)Citytype cityType;

@end

NS_ASSUME_NONNULL_END
