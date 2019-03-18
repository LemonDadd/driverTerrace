//
//  UrlSetting.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#ifndef UrlSetting_h
#define UrlSetting_h

#define Api_IP @"http://112.35.59.149:8081"
#define BaseUrl(api_IP, lastUrl) ([NSString stringWithFormat:@"%@%@", (api_IP), (lastUrl)])

/**
 *  发送验证码
 */
#define SendPhoneCodeBaseUrl BaseUrl(Api_IP, @"/driverAppController/sendPhoneCode")

/**
 *  司机端注册接口
 */
#define DriverRegisterBaseUrl BaseUrl(Api_IP, @"/driverAppController/driverRegister")

/**
 *  司机端登录接口
 */
#define DriverLoginBaseUrl BaseUrl(Api_IP, @"/driverAppController/driverLogin")

/**
 *   司机端修改密码
 */
#define DriveralterBaseUrl BaseUrl(Api_IP, @"/driverAppController/driveralter")

/**
 *司机端修改个人信息
 */
#define AlterMessageBaseUrl BaseUrl(Api_IP, @"/driverAppController/alterMessage")

/**
 *  司机端填写请假单
 */
#define LeavetableBaseUrl BaseUrl(Api_IP, @"/driverAppController/leavetable")

/**
 *  司机端请假列表
 */
#define LeavelistBaseUrl BaseUrl(Api_IP, @"/driverAppController/leavelist")

/**
 *  司机端进行中的订单
 */
#define GetUnderwayOrderBaseUrl BaseUrl(Api_IP, @"/driverAppController/getUnderwayOrder")

/**
 *  司机端我的行程列表
 */
#define GetOrderListByDriveridBaseUrl BaseUrl(Api_IP, @"/driverAppController/getOrderListByDriverid")

/**
 *  订单详情，导航到用户订单出发点
 */
#define GetPassengerInfoBaseUrl BaseUrl(Api_IP, @"/driverAppController/getPassengerInfo")

/**
 *  发送验证码
 */
#define SendPhoneCodeBaseUrl BaseUrl(Api_IP, @"/driverAppController/sendPhoneCode")



#endif /* UrlSetting_h */
