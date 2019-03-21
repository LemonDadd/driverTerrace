//
//  MyInfoModel.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MyInfoModel.h"

//用户信息
#define MyInfoKey @"MyInfoKey"

@implementation MyInfoModel

+ (MyInfoModel*)getMyInfoModel {
    @synchronized (self) {
        NSDictionary* userInfoDic = [[CacheDeal getInstancetype] getObject:MyInfoKey];
        if (userInfoDic == nil) {
            return nil;
        }
        MyInfoModel *userinfoModel = [MyInfoModel mj_objectWithKeyValues:userInfoDic];
        //        UserInfoModel* UserInfoModel = [UserInfoModel mj_objectWithKeyValues:userInfoDic];
        TT_RELEASE_SAFELY(userInfoDic);
        staticMyInfoModel = userinfoModel;
        return userinfoModel;
    }
}

- (void)saveMyInfoModel {
    @synchronized (self) {
        NSDictionary *dic = [self mj_keyValues];
        [[CacheDeal getInstancetype] saveObject:dic key:MyInfoKey];
        staticMyInfoModel = [MyInfoModel mj_objectWithKeyValues:dic];
    }
}

+ (void)clearUserInfoModel {
    @synchronized (self) {
        staticMyInfoModel = nil;
        [[CacheDeal getInstancetype] removeDataKey:MyInfoKey];
    }
}

+ (void)saveUserHeadImagePath:(NSString*)imagePath{
    if (imagePath.length == 0) {
        return;
    }
    @synchronized (self) {
        NSMutableDictionary* userInfoDic = [[NSMutableDictionary alloc] initWithDictionary:[[CacheDeal getInstancetype] getObject:MyInfoKey]];
        [userInfoDic removeObjectForKey:@"portrait"];
        
        [userInfoDic setObject:imagePath forKey:@"portrait"];
        [[CacheDeal getInstancetype] removeDataKey:MyInfoKey];
        [[CacheDeal getInstancetype] saveObject:userInfoDic key:MyInfoKey];
        staticMyInfoModel = [MyInfoModel mj_objectWithKeyValues:userInfoDic];
    }
}


@end
