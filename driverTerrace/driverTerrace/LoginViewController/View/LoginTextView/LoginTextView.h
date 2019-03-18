//
//  LoginTextView.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoginTextViewType) {
    LoginTextViewTypeMsg,
    LoginTextViewTypePass,
};

typedef void(^MsgEvent)(void);

@interface LoginTextView : BaseView

@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIButton *msgBtn;
@property (nonatomic, strong)UIButton *passBtn;
@property (nonatomic, copy)NSString *placeholder;

@property (nonatomic, copy)MsgEvent msgEvent;
@property (nonatomic, assign)LoginTextViewType type;


@end

NS_ASSUME_NONNULL_END
