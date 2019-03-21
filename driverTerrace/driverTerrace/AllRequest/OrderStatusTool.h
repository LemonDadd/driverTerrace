//
//  OrderStatusTool.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderStatusTool : NSObject

+(NSString *)getOrderStatus:(NSInteger)status;
+(NSString *)getCarStatu:(NSInteger)status;
+(NSString *)getPayStatus:(NSInteger)status;

@end

NS_ASSUME_NONNULL_END
