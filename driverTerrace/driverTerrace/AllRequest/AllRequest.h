//
//  AllRequest.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "JsonDeal.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllRequest : JsonDeal

/**
 发送验证码
 */
+ (void)requestSendPhoneCodeByPhone:(NSString *)phone
                                Key:(NSInteger)key
                            request:(void(^)(BOOL message,
                                             NSString *errorMsg))request;

/**
 注册
 */
+ (void)requestDriverRegisterByPhone:(NSString *)phone
                            password:(NSString *)password
                           phoneCode:(NSString *)phoneCode
                             request:(void(^)(BOOL message,
                                              NSString *errorMsg))request;

/**
 登录
 */
+ (void)requestDriverLoginByPhone:(NSString *)phone
                         password:(NSString *)password
                              key:(NSInteger)key
                          request:(void(^)(UserInfoModel *message,
                                           NSString *errorMsg))request;

/**
 修改密码
 */
+ (void)requestDriveralterByPhone:(NSString *)phone
                         password:(NSString *)password
                        phoneCode:(NSString *)phoneCode
                          request:(void(^)(BOOL message,
                                           NSString *errorMsg))request;

/**
 修改个人信息
 */
+ (void)requestAlterMessageByName:(NSString *)name
                              sex:(NSString *)sex
                         nickname:(NSString *)nickname
                     portraitFile:(NSString *)portraitFile
                       drivingage:(NSString *)drivingage
                      platenumber:(NSString *)platenumber
                             type:(NSString *)type
                               id:(NSString *)Id
                          request:(void(^)(BOOL message,
                                           NSString *errorMsg))request;

/**
 填写请假单
 */
+ (void)requestLeavetableByDriverid:(NSString *)driverId
                         begintinme:(NSString *)begintinme
                           overtime:(NSString *)overtime
                        oaleavetype:(NSString *)oaleavetype
                        leavereason:(NSString *)leavereason
                            request:(void(^)(NSString *message,
                                             NSString *errorMsg))request;

/**
 请假列表
 */
+ (void)requestLeavelistBydriverId:(NSString *)driverid
                            pageNo:(NSInteger)pageNo
                    approvalstatus:(NSInteger)approvalstatus
                           request:(void(^)(NSArray *message,
                                            NSString *errorMsg))request;

/**
 进行中的订单
 */
+ (void)requestGetUnderwayOrderByDriverid:(NSString *)driverid
                                  request:(void(^)(NSArray *message,
                                                   NSString *errorMsg))request;

/**
 我的行程列表
 */
+ (void)requestGetOrderListByDriveridByDriverid:(NSString *)driverid
                                         pageNo:(NSInteger)pageNo
                                        request:(void(^)(NSArray *message,
                                                         NSString *errorMsg))request;

/**
 订单详情，导航到用户订单出发点
 */
+ (void)requestgGetPassengerInfoByUserOrderId:(NSString *)userOrderId
                                      request:(void(^)(NSArray *message,
                                                       NSString *errorMsg))request;




@end

NS_ASSUME_NONNULL_END
