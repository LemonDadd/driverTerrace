//
//  MyView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MyView.h"
#import "MyHeaderTableViewCell.h"
#import "MyTextFieldTableViewCell.h"
#import "LZPickerView.h"

@interface MyView ()<UITableViewDelegate,UITableViewDataSource,ACActionSheetDelegate>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *array;
@property (nonatomic, strong)NSArray *parray;
@property (nonatomic,strong)LZPickerView *lzPickerVIew;
@property (nonatomic, strong)UIView *bg;

@property (nonatomic, strong)UITextField *name;
@property (nonatomic, strong)UITextField *sex;
@property (nonatomic, strong)UITextField *phone;
@property (nonatomic, strong)UITextField *idCard;
@property (nonatomic, strong)UITextField *driveCard;
@property (nonatomic, strong)UITextField *plateNumber;
@property (nonatomic, strong)UITextField *car;
@property (nonatomic, strong)UITextField *age;
@property (nonatomic, strong)UIImage *pic;


@property (nonatomic, strong)ACMediaPickerManager *manager ;


@end

@implementation MyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = @[@"头像",@"姓名",@"性别",@"手机号",@"身份证",@"驾驶证",@"牌照",@"车型",@"驾龄"];
        _parray = @[@"头像",@"请输入姓名",@"选择性别",@"请输入手机号",@"请输入身份证",@"请输入驾驶证",@"请输入牌照",@"请输入车型",@"请选择驾龄"];
        
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tab.backgroundColor = [UIColor whiteColor];
        _tab.layer.masksToBounds  = YES;
        _tab.layer.cornerRadius = 8.f;
        _tab.delegate =self;
        _tab.dataSource =self;
        _tab.estimatedRowHeight =50;
        _tab.estimatedSectionFooterHeight=0;
        _tab.estimatedSectionHeaderHeight =0;
        _tab.separatorColor = kRGBColor(237, 237, 237);
        [self addSubview:_tab];
        [self setExtraCellLineHidden:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        if ([_tab respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tab setSeparatorInset:UIEdgeInsetsZero];
        }
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"LZPickerView" owner:nil options:nil];
        self.lzPickerVIew  = views[0];
        
        [[SDWebImageManager sharedManager]loadImageWithURL:[NSURL URLWithString:[UserInfoModel getUserInfoModel].portrait] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            self->_pic = image;
        }];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyHeaderTableViewCell"];
        if (cell == nil) {
            cell = [[MyHeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyHeaderTableViewCell"];
        }
        cell.leftLabel.text = _array[indexPath.row];
        if (_pic) {
            cell.imageV.image = _pic;
        }else {
            [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[UserInfoModel getUserInfoModel].portrait]];
        }
        return cell;
    } else {
        MyTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTextFieldTableViewCell"];
        if (cell == nil) {
            cell = [[MyTextFieldTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTextFieldTableViewCell"];
        }
        
        cell.textField.placeholder = _parray[indexPath.row];
        cell.leftLabel.text = _array[indexPath.row];
        cell.textField.enabled =true;
        if (indexPath.row == 2|| indexPath.row == 8) {
            cell.textField.enabled =false;
        }
        
        switch (indexPath.row) {
            case 1:
                cell.textField.text = [UserInfoModel getUserInfoModel].drivernickname;
                self.name = cell.textField;
                break;
            case 2:
                self.sex = cell.textField;
                break;
            case 3:
                self.phone = cell.textField;
                break;
            case 4:
                self.idCard = cell.textField;
                break;
            case 5:
                self.driveCard = cell.textField;
                break;
            case 6:
                self.plateNumber = cell.textField;
                break;
            case 7:
                self.car = cell.textField;
                break;
            case 8:
                self.age = cell.textField;
                break;
            default:
                break;
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    kWeakSelf(self);
    if (indexPath.row == 0) {
        ACActionSheet *actionSheet = [[ACActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
        [actionSheet show];
    }
    
    if (indexPath.row == 2) {
        [self resignFirstResponder];
        [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
        self.lzPickerVIew.dataSource =@[@"男",@"女"];
        self.lzPickerVIew.titleText = @"性别";
        self.lzPickerVIew.selectValue  = ^(NSString *value){
            weakself.sex.text = value;
        };
        [self.lzPickerVIew show];
    }
    
    if (indexPath.row == 8) {
        [self resignFirstResponder];
        [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
        self.lzPickerVIew.dataSource = @[@"1年以下",@"1年",@"2年",@"3年",@"4年",@"5年",@"6年",@"7年",@"8年",@"9年",@"10年",@"10年以上"];
        self.lzPickerVIew.titleText = @"驾龄";
        self.lzPickerVIew.selectValue  = ^(NSString *value){
            weakself.age.text = value;
        };
        [self.lzPickerVIew show];
        
    }
}

#pragma mark
-(void)save {
    
    if (!_pic) {
        [CustomView alertMessage:@"请选择头像" view:self];
        return;
    }
    
    if (!self.name.text.length) {
        [CustomView alertMessage:@"请输入昵称" view:self];
        return;
    }
    if (!self.sex.text.length) {
        [CustomView alertMessage:@"请选择性别" view:self];
        return;
    }
    if (!self.phone.text.length) {
        [CustomView alertMessage:@"请输入手机号" view:self];
        return;
    }
    if (!self.idCard.text.length) {
        [CustomView alertMessage:@"请输入身份证号" view:self];
        return;
    }
    if (!self.driveCard.text.length) {
        [CustomView alertMessage:@"请输入驾驶证号" view:self];
        return;
    }
    if (!self.plateNumber.text.length) {
        [CustomView alertMessage:@"请输入车牌号" view:self];
        return;
    }
    if (!self.car.text.length) {
        [CustomView alertMessage:@"请输入车型" view:self];
        return;
    }
    if (!self.age.text.length) {
        [CustomView alertMessage:@"请选择驾龄" view:self];
        return;
    }
   
    [AllRequest requestAlterMessageByName:self.name.text sex:[self.sex.text isEqualToString:@"男"]?1:2 nickname:self.name.text portraitFile:[self imageToString:_pic] drivingage:self.age.text  platenumber:self.plateNumber.text type:self.car.text id:[UserInfoModel getUserInfoModel].driverid request:^(BOOL message, NSString * _Nonnull errorMsg) {
        if (message) {
            
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
    
}


#pragma mark - ACActionSheet delegate
- (void)actionSheet:(ACActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex {
    MJWeakSelf;
    
    if (buttonIndex == 0) {
        _manager = [[ACMediaPickerManager alloc]init];
        _manager.didFinishPickingBlock = ^(NSArray<ACMediaModel *> *list) {
            for (ACMediaModel*model in list) {
                weakSelf.pic = model.originalImage;
            }
            [weakSelf.tab reloadData];
        };
        _manager.maxImageSelected =1;
        _manager.pickerSource = ACMediaPickerSourceFromCamera;
        [_manager openCustomAlbum];
    }
    if (buttonIndex == 1) {
        _manager = [[ACMediaPickerManager alloc]init];
        _manager.didFinishPickingBlock = ^(NSArray<ACMediaModel *> *list) {
            for (ACMediaModel*model in list) {
                weakSelf.pic = model.originalImage;
            }
            [weakSelf.tab reloadData];
        };
        _manager.maxImageSelected =1;
        _manager.pickerSource = ACMediaPickerSourceFromAlbum;
        [_manager openCustomAlbum];
    }
  
}

- (NSString *)imageToString:(id)image {
    
    if ([image isKindOfClass:[NSString class]]) {
        return @"";
    }else {
        NSData *imagedata = [self resetSizeOfImageData:image maxSize:10];
        NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        return image64;
        
    }
}

#pragma mark - 图片压缩
- (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize {
    //先判断当前质量是否满足要求，不满足再进行压缩
    __block NSData *finallImageData = UIImageJPEGRepresentation(sourceImage,1.0);
    NSUInteger sizeOrigin   = finallImageData.length;
    NSUInteger sizeOriginKB = sizeOrigin / 1000;
    
    if (sizeOriginKB <= maxSize) {
        return finallImageData;
    }
    
    //获取原图片宽高比
    CGFloat sourceImageAspectRatio = sourceImage.size.width/sourceImage.size.height;
    //先调整分辨率
    CGSize defaultSize = CGSizeMake(1024, 1024/sourceImageAspectRatio);
    UIImage *newImage = [self newSizeImage:defaultSize image:sourceImage];
    
    finallImageData = UIImageJPEGRepresentation(newImage,1.0);
    
    //保存压缩系数
    NSMutableArray *compressionQualityArr = [NSMutableArray array];
    CGFloat avg   = 1.0/250;
    CGFloat value = avg;
    for (int i = 250; i >= 1; i--) {
        value = i*avg;
        [compressionQualityArr addObject:@(value)];
    }
    
    /*
     调整大小
     说明：压缩系数数组compressionQualityArr是从大到小存储。
     */
    //思路：使用二分法搜索
    finallImageData = [self halfFuntion:compressionQualityArr image:newImage sourceData:finallImageData maxSize:maxSize];
    //如果还是未能压缩到指定大小，则进行降分辨率
    while (finallImageData.length == 0) {
        //每次降100分辨率
        CGFloat reduceWidth = 100.0;
        CGFloat reduceHeight = 100.0/sourceImageAspectRatio;
        if (defaultSize.width-reduceWidth <= 0 || defaultSize.height-reduceHeight <= 0) {
            break;
        }
        defaultSize = CGSizeMake(defaultSize.width-reduceWidth, defaultSize.height-reduceHeight);
        UIImage *image = [self newSizeImage:defaultSize
                                      image:[UIImage imageWithData:UIImageJPEGRepresentation(newImage,[[compressionQualityArr lastObject] floatValue])]];
        finallImageData = [self halfFuntion:compressionQualityArr image:image sourceData:UIImageJPEGRepresentation(image,1.0) maxSize:maxSize];
    }
    return finallImageData;
}
#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {
    CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark 二分法
- (NSData *)halfFuntion:(NSArray *)arr image:(UIImage *)image sourceData:(NSData *)finallImageData maxSize:(NSInteger)maxSize {
    NSData *tempData = [NSData data];
    NSUInteger start = 0;
    NSUInteger end = arr.count - 1;
    NSUInteger index = 0;
    
    NSUInteger difference = NSIntegerMax;
    while(start <= end) {
        index = start + (end - start)/2;
        
        finallImageData = UIImageJPEGRepresentation(image,[arr[index] floatValue]);
        
        NSUInteger sizeOrigin = finallImageData.length;
        NSUInteger sizeOriginKB = sizeOrigin / 1024;
        NSLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
        NSLog(@"\nstart：%zd\nend：%zd\nindex：%zd\n压缩系数：%lf", start, end, (unsigned long)index, [arr[index] floatValue]);
        
        if (sizeOriginKB > maxSize) {
            start = index + 1;
        } else if (sizeOriginKB < maxSize) {
            if (maxSize-sizeOriginKB < difference) {
                difference = maxSize-sizeOriginKB;
                tempData = finallImageData;
            }
            if (index<=0) {
                break;
            }
            end = index - 1;
        } else {
            break;
        }
    }
    return tempData;
}


-(void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = 8.f;
    self.layer.shadowColor = kColorWithHex(0x9F9F9F).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = self.bounds.size.width;
    float height = self.bounds.size.height;
    float x = self.bounds.origin.x;
    float y = self.bounds.origin.y;
    float addWH = 5;
    
    CGPoint topLeft      = self.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
    CGPoint topRight     = CGPointMake(x+width,y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    
    [path moveToPoint:topLeft];
    //添加四个二元曲线
    [path addQuadCurveToPoint:topRight
                 controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight
                 controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft
                 controlPoint:leftMiddle];
    //设置阴影路径
    self.layer.shadowPath = path.CGPath;
}


@end
