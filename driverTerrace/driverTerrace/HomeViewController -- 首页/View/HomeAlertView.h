//
//  HomeAlertView.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeAlertView : BaseView

@property (nonatomic, assign)NSInteger indx;

- (instancetype)initWithList:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
