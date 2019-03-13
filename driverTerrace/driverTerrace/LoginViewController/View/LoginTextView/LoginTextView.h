//
//  LoginTextView.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^MsgEvent)(void);

@interface LoginTextView : BaseView

@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIButton *msgBtn;
@property (nonatomic, assign)BOOL showMsgBtn;

@property (nonatomic, copy)MsgEvent msgEvent;
@end

NS_ASSUME_NONNULL_END
