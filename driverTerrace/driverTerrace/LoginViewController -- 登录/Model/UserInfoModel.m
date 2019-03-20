//
//  UserInfoModel.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "UserInfoModel.h"

//用户信息
#define UserInfoKey @"UserInfoKey"

@implementation UserInfoModel

+ (UserInfoModel*)getUserInfoModel {
    @synchronized (self) {
        NSDictionary* userInfoDic = [[CacheDeal getInstancetype] getObject:UserInfoKey];
        if (userInfoDic == nil) {
            return nil;
        }
        UserInfoModel *userinfoModel = [UserInfoModel mj_objectWithKeyValues:userInfoDic];
//        UserInfoModel* UserInfoModel = [UserInfoModel mj_objectWithKeyValues:userInfoDic];
        TT_RELEASE_SAFELY(userInfoDic);
        staticUserInfoModel = userinfoModel;
        return userinfoModel;
    }
}

- (void)saveUserInfoModel {
    @synchronized (self) {
        NSDictionary *dic = [self mj_keyValues];
        [[CacheDeal getInstancetype] saveObject:dic key:UserInfoKey];
        staticUserInfoModel = [UserInfoModel mj_objectWithKeyValues:dic];
    }
}

+ (void)clearUserInfoModel {
    @synchronized (self) {
        staticUserInfoModel = nil;
        [[CacheDeal getInstancetype] removeDataKey:UserInfoKey];
    }
}

+ (void)saveUserHeadImagePath:(NSString*)imagePath{
    if (imagePath.length == 0) {
        return;
    }
    @synchronized (self) {
        NSMutableDictionary* userInfoDic = [[NSMutableDictionary alloc] initWithDictionary:[[CacheDeal getInstancetype] getObject:UserInfoKey]];
        [userInfoDic removeObjectForKey:@"photo"];
        
        [userInfoDic setObject:imagePath forKey:@"photo"];
        [[CacheDeal getInstancetype] removeDataKey:UserInfoKey];
        [[CacheDeal getInstancetype] saveObject:userInfoDic key:UserInfoKey];
        staticUserInfoModel = [UserInfoModel mj_objectWithKeyValues:userInfoDic];
    }
}

+ (UserInfoModel *)setValue:(id)value forKey:(NSString *)key {
    if (value == nil ||
        key == nil) {
        return nil;
    }
    UserInfoModel *userInfoModel = [UserInfoModel getUserInfoModel];
    [UserInfoModel setValue:value forKey:key];
    [userInfoModel saveUserInfoModel];
    staticUserInfoModel = userInfoModel;
    return userInfoModel;
}
@end
