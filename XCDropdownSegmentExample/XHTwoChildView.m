//
//  TwoView.m
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import "XHTwoChildView.h"
//#import "XHActivityModel.h"


#define ZLUnselectedColor [UIColor colorWithHexString:@"#B5B5B5"]
#define ZLSelectedColor   [UIColor colorWithHexString:@"#4180E9"]

@interface XHTwoChildView ()

// 标签数组(按钮文字)
@property (nonatomic, strong) NSArray *dataSoucreArr;

// 按钮数组
@property (nonatomic, strong) NSMutableArray *btnArray;

// 选中按钮
@property (nonatomic, strong) UIButton *selectedBtn;

//背景图片
@property(nonatomic ,strong) UIView *btnsBgView;

@property (nonatomic,copy) NSString *category_id;

@end

@implementation XHTwoChildView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}

- (void)setupRadioBtnView {
    
    self.btnArray = [NSMutableArray array];
//    self.dataSoucreArr = [[NSMutableArray alloc] initWithObjects:@"不限",@"互联网",@"财经金融", @"通信技术", @"通信技术", @"通信技术", @"通信技术", @"通信技术", @"通信技术", @"互联网", @"互联网",  nil];
    
    CGFloat UI_View_Width = [UIScreen mainScreen].bounds.size.width;
    CGFloat marginX = 15;
    CGFloat top = 10;
    CGFloat btnH = 30;
    CGFloat width = (UI_View_Width - marginX * 5) / 4;
    
    // 按钮背景
    
    
    
//    UIView *btnsBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT *0.5)];
//    btnsBgView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:btnsBgView];
//    self.btnsBgView = btnsBgView;
//
//    // 循环创建按钮
//    NSInteger maxCol = 4;
//    for (NSInteger i = 0; i < self.dataSoucreArr.count; i++) {
//
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////        btn.backgroundColor = ZLUnselectedColor;
//        btn.layer.cornerRadius = 5.0; // 按钮的边框弧度
//        btn.clipsToBounds = YES;
//        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//        btn.layer.borderWidth = 1;
//        btn.layer.borderColor = ZLUnselectedColor.CGColor;
//
//        [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
//        [btn setTitleColor:ZLSelectedColor forState:UIControlStateSelected];
//        [btn addTarget:self action:@selector(chooseMark:) forControlEvents:UIControlEventTouchUpInside];
//        NSInteger col = i % maxCol; //列
//        btn.kf5_x = marginX + col * (width + marginX);
//        NSInteger row = i / maxCol; //行
//        btn.kf5_y = top + row * (btnH + marginX);
//        btn.width = width;
//        btn.height = btnH;
//
//        XHActivityModel*model = [self.dataSoucreArr safeObjectAtIndex: i];
//        [btn setTitle:model.category_cn_name forState:UIControlStateNormal];
//        [btnsBgView addSubview:btn];
//        btn.tag = i;
//        [self.btnArray addObject:btn];
//
//        if ([self.category_id isEqualToString:model.category_id]) {
//            btn.layer.borderColor = ZLSelectedColor.CGColor;
//            [btn setTitleColor:ZLSelectedColor forState:UIControlStateNormal];
//        } else {
//            btn.layer.borderColor = ZLUnselectedColor.CGColor;
//            [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
//        }
//    }
    
    // 创建完btn后再判断是否能选择(之前是已经选取过的)
    // 假数据:之前已经上传16时,则回显16
//    for (UIButton *btn in btnsBgView.subviews) {
//        if ([@"16" isEqualToString:btn.titleLabel.text]) {
//            btn.selected = YES;
//            btn.backgroundColor = ZLSelectedColor;
//            break;
//        }
//    }
}


- (void)chooseMark:(UIButton *)sender {
    
    NSLog(@"点击了%@", sender.titleLabel.text);

    self.selectedBtn = sender;
    
    sender.selected = !sender.selected;

    for (NSInteger j = 0; j < [self.btnArray count]; j++) {
        UIButton *btn = self.btnArray[j] ;
        if (sender.tag == j) {
            btn.selected = sender.selected;
        } else {
            btn.selected = NO;
        }
//        btn.backgroundColor = ZLUnselectedColor;
//        btn.layer.borderColor = ZLUnselectedColor.CGColor;
    }
    
//    UIButton *btn = self.btnArray[sender.tag];
//    if (btn.selected) {
////        btn.backgroundColor = ZLSelectedColor;
//        btn.layer.borderColor = ZLSelectedColor.CGColor;
//        [btn setTitleColor:ZLSelectedColor forState:UIControlStateSelected];
//    } else {
////        btn.backgroundColor = ZLUnselectedColor;
//        btn.layer.borderColor = ZLUnselectedColor.CGColor;
//        [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateSelected];
//    }

//    XHActivityModel*model = [self.dataSoucreArr safeObjectAtIndex: sender.tag ];
//
//    self.category_id = model.category_id;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:category_id:category_cn_name:)]) {
//        [self.delegate twoViewRightTableDidSelectedWithLeftIndex:sender.tag IndexTitle:sender.titleLabel.text mcid:model.category_id ];
        
//        [self.delegate dropdownSegment:self category_id:model.category_id category_cn_name:model.category_cn_name];
       
    }
}

-(void)updateDataArr:(NSMutableArray *)dataArray{
    
    self.dataSoucreArr = dataArray;
 
    
}



-(void)removeSuperview{
    [self.btnsBgView removeFromSuperview];
}
@end
