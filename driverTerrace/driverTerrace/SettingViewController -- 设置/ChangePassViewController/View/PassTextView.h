//
//  PassTextView.h
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PassTextViewType) {
    PassTextViewTypeMsg,
    PassTextViewTypePass,
};

typedef void(^MsgEvent)(void);

@interface PassTextView : BaseView

@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIButton *msgBtn;
@property (nonatomic, strong)UIButton *passBtn;
@property (nonatomic, copy)NSString *placeholder;

@property (nonatomic, copy)MsgEvent msgEvent;
@property (nonatomic, assign)PassTextViewType type;

@end

NS_ASSUME_NONNULL_END
