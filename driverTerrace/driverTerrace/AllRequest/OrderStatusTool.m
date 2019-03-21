//
//  OrderStatusTool.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "OrderStatusTool.h"

@implementation OrderStatusTool

+(NSString *)getOrderStatus:(NSInteger)status{
    switch (status) {
        case 0:
            //送程中
            return @"送程中";
            break;
        case 2:
            //已完成
            return @"已完成";
            break;
        case 3:
            //已超时
            return @"已超时";
            break;
        case 4:
            //已取消
            return @"已取消";
            break;
        case 5:
            //待支付
            return @"待支付";
            break;
        case 6:
            //正在派车
            return @"正在派车";
            break;
        case 7:
            //正在接客
            return @"正在接客";
            break;
        case 8:
            //确认到达目的地
            return @"确认到达目的地";
            break;
        default:
            //已到达接乘点
            return @"已到达接乘点";
            break;
    }
}

+(NSString *)getCarStatu:(NSInteger)status{
    if (status == 0||status == 8) {
        return @"已上车";
    }
    if (status == 2) {
        return @"已下车";
    }
    return @"";
}

+(NSString *)getPayStatus:(NSInteger)status{
    if (status == 5||status == 4||status == 3) {
        return @"未付款";
    }else
    return @"已付款";
}

@end
