//
//  AllRequest.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AllRequest.h"

#define ErrorMessage @"数据请求失败,请检查您的网络"

@implementation AllRequest

/**
 发送验证码
 */
+ (void)requestSendPhoneCodeByPhone:(NSString *)phone
                                Key:(NSInteger)key
                            request:(void(^)(BOOL message,
                                             NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:@(key) forKey:@"key"];
    [HttpHelper httpDataRequestByGetMethod:SendPhoneCodeBaseUrl paramDictionary:paramDic request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL success = [[dic objectForKey:@"success"] integerValue];
                if (success) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false, data);
        }
    }];
//    [HttpHelper httpDataRequestByGetMethod:SendPhoneCodeBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
//
//    }];
}

/**
 注册
 */
+ (void)requestDriverRegisterByPhone:(NSString *)phone
                            password:(NSString *)password
                           phoneCode:(NSString *)phoneCode
                             request:(void(^)(BOOL message,
                                              NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:password forKey:@"password"];
    [paramDic setObject:phoneCode forKey:@"phoneCode"];
    [HttpHelper httpDataRequestByGetMethod:DriverRegisterBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL success = [[dic objectForKey:@"success"] integerValue];
                if (success) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 登录
 */
+ (void)requestDriverLoginByPhone:(NSString *)phone
                         password:(NSString *)password
                              key:(NSInteger)key
                          request:(void(^)(UserInfoModel *message,
                                           NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:password forKey:@"password"];
    [paramDic setObject:@(key) forKey:@"key"];
    [HttpHelper httpDataRequestByGetMethod:DriverLoginBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *modelDic = dic[@"body"][@"driver"];
                    UserInfoModel *model = [UserInfoModel mj_objectWithKeyValues:modelDic];
                    request(model, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 修改密码
 */
+ (void)requestDriveralterByPhone:(NSString *)phone
                         password:(NSString *)password
                        phoneCode:(NSString *)phoneCode
                          request:(void(^)(BOOL message,
                                           NSString *errorMsg))request{
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:password forKey:@"password"];
    [paramDic setObject:phoneCode forKey:@"phoneCode"];
    [HttpHelper httpDataRequestByGetMethod:DriveralterBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL success = [[dic objectForKey:@"success"] integerValue];
                if (success) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 修改个人信息
 */
+ (void)requestAlterMessageByName:(NSString *)name
                              sex:(NSInteger)sex
                         nickname:(NSString *)nickname
                     portraitFile:(NSString *)portraitFile
                       drivingage:(NSString *)drivingage
                      platenumber:(NSString *)platenumber
                             type:(NSString *)type
                               id:(NSString *)Id
                          request:(void(^)(BOOL message,
                                           NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:name forKey:@"name"];
    [paramDic setObject:@(sex) forKey:@"sex"];
    [paramDic setObject:nickname forKey:@"nickname"];
    [paramDic setObject:portraitFile forKey:@"portraitFile"];
    [paramDic setObject:drivingage forKey:@"drivingage"];
    [paramDic setObject:platenumber forKey:@"platenumber"];
    [paramDic setObject:type forKey:@"type"];
    [paramDic setObject:Id forKey:@"id"];
    [HttpHelper httpDataRequestByGetMethod:AlterMessageBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL success = [[dic objectForKey:@"success"] integerValue];
                if (success) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 填写请假单
 */
+ (void)requestLeavetableByDriverid:(NSString *)driverId
                         begintinme:(NSString *)begintinme
                           overtime:(NSString *)overtime
                        oaleavetype:(NSString *)oaleavetype
                        leavereason:(NSString *)leavereason
                            request:(void(^)(NSString *message,
                                             NSString *errorMsg))request {
    
}

/**
 请假列表
 */
+ (void)requestLeavelistBydriverId:(NSString *)driverid
                            pageNo:(NSInteger)pageNo
                    approvalstatus:(NSInteger)approvalstatus
                           request:(void(^)(NSArray *message,
                                            NSString *errorMsg))request {
    
}

/**
 进行中的订单
 */
+ (void)requestGetUnderwayOrderByDriverid:(NSString *)driverid
                                  request:(void(^)(OrderModel *message,
                                                   NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:driverid forKey:@"driverid"];
    [HttpHelper httpDataRequestByGetMethod:GetUnderwayOrderBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *data = dic[@"body"];
                    OrderModel *model = [OrderModel mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 我的行程列表
 */
+ (void)requestGetOrderListByDriveridByDriverid:(NSString *)driverid
                                         pageNo:(NSInteger)pageNo
                                        request:(void(^)(NSArray *message,
                                                         NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:driverid forKey:@"driverid"];
    [paramDic setObject:@(pageNo) forKey:@"pageNo"];
    [HttpHelper httpDataRequestByGetMethod:GetOrderListByDriveridBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSArray *data = dic[@"body"][@"orderList"];
                    NSMutableArray *ma =[NSMutableArray new];
                    for (NSDictionary *dic in data) {
                        RouteListModel *model = [RouteListModel mj_objectWithKeyValues:dic];
                        [ma addObject:model];
                    }
                    request([ma copy], nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

/**
 订单详情，导航到用户订单出发点
 */
+ (void)requestgGetPassengerInfoByUserOrderId:(NSString *)userOrderId
                                      request:(void(^)(NSArray *message,
                                                       NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:userOrderId forKey:@"userOrderId"];
    [HttpHelper httpDataRequestByGetMethod:GetPassengerInfoBaseUrl paramDictionary:paramDic TimeOutSeconds:120  request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSArray *data = dic[@"body"];
                    request(data, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

@end
