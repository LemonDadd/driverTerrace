//
//  AddPassengerView.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddPassengerView : BaseView

@property (nonatomic, strong)OrderModel *model;

- (void)save;

@end

NS_ASSUME_NONNULL_END
