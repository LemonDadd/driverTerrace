//
//  UrlSetting.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#ifndef UrlSetting_h
#define UrlSetting_h

//#define Api_IP @"http://112.35.59.149:8081"
#define  Api_IP @"http://192.168.1.104:8082"
#define BaseUrl(api_IP, lastUrl) ([NSString stringWithFormat:@"%@%@", (api_IP), (lastUrl)])

/**
 *  发送验证码(完成)
 */
#define SendPhoneCodeBaseUrl BaseUrl(Api_IP, @"/driverAppController/sendPhoneCode")

/**
 *  司机端注册接口(完成)
 */
#define DriverRegisterBaseUrl BaseUrl(Api_IP, @"/driverAppController/driverRegister")

/**
 *  司机端登录接口(完成)
 */
#define DriverLoginBaseUrl BaseUrl(Api_IP, @"/driverAppController/driverLogin")

/**
 *   司机端修改密码(完成)
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
 *  获取用户信息
 */
#define PersonMessageBaseUrl BaseUrl(Api_IP, @"/driverAppController/personMessage")

/**
 *  添加乘客信息
 */
#define OfflineUserBaseUrl BaseUrl(Api_IP, @"/driverAppController/offlineUser")

/**
 *  根据司机订单id 查询用户订单列表
 */
#define GetUserOrderListByOrderIdBaseUrl BaseUrl(Api_IP, @"/driverAppController/getUserOrderListByOrderId")

/**
 *  发送验证码
 */
#define SendPhoneCodeBaseUrl BaseUrl(Api_IP, @"/driverAppController/sendPhoneCode")



#endif /* UrlSetting_h */
