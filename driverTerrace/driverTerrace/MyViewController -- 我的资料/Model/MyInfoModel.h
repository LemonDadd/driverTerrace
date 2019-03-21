//
//  MyInfoModel.h
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MyInfoModel;
static MyInfoModel *staticMyInfoModel;

@interface MyInfoModel : NSObject

@property (nonatomic, copy)NSString *portrait;
@property (nonatomic, copy)NSString *id;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, copy)NSString *phone;
@property (nonatomic, copy)NSString *idcard;
@property (nonatomic, copy)NSString *drivinglicence;
@property (nonatomic, copy)NSString *drivingage;
@property (nonatomic, copy)NSString *platenumber;
@property (nonatomic, copy)NSString *type;


/**
 *  获取用户信息
 */
+ (MyInfoModel*)getMyInfoModel;

/**
 *  保存用户信息
 */
- (void)saveMyInfoModel;

/**
 *  清除用户信息
 */
+ (void)clearMyInfoModel;

/**
 *  切换用户的头像
 */
+ (void)saveUserHeadImagePath:(NSString*)imagePath;


@end

NS_ASSUME_NONNULL_END
