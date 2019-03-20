//
//  UserInfoModel.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfoModel;
static UserInfoModel *staticUserInfoModel;

@interface UserInfoModel : NSObject

@property (nonatomic, copy) NSString *driverid;//司机id
@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *drivernickname;//司机昵称
@property (nonatomic, assign) NSInteger carcount;//累计发车次数
@property (nonatomic, assign) NSInteger totalpeople;//累计载客人数
@property (nonatomic, copy) NSString *outdate;//发车时间
@property (nonatomic, copy) NSString *outtype;//出车类型 线路车（1）  专车（2） 包车（3） 其他（4）
@property (nonatomic, copy) NSString *circuitname;//线路名称
@property (nonatomic, assign) CGFloat circuitprice;//线路单价
@property (nonatomic, copy) NSString *passengerportrait;//乘客头像
@property (nonatomic, copy) NSString *passengernickname;//乘客昵称
@property (nonatomic, copy) NSString *passengerid;//乘客id
@property (nonatomic, assign) NSInteger takenumber;//乘坐人数
@property (nonatomic, copy) NSString *paystatus;//支付状态
@property (nonatomic, copy) NSString *circuitstart;//出发地名称
@property (nonatomic, copy) NSString *circuitdestination;//目的地名称

/**
 *  获取用户信息
 */
+ (UserInfoModel*)getUserInfoModel;

/**
 *  保存用户信息
 */
- (void)saveUserInfoModel;

/**
 *  清除用户信息
 */
+ (void)clearUserInfoModel;

/**
 *  切换用户的头像
 */
+ (void)saveUserHeadImagePath:(NSString*)imagePath;


/**
 设置用户属性值
 */
+ (UserInfoModel *)setValue:(id)value forKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
