//
//  XCTestViewController.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/21.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCTestViewController.h"

#import "XCDropdownSegment.h"
#import "XCDropdownSegmentHeader.h"
#import "UIColor+Hex.h"
#define ImageNamed(name)   [UIImage imageNamed:name]

@interface XCTestViewController ()<XCDropdownSegmentDataSource, XCDropdownSegmentDelegate,XHOneChildViewDelegate,XHTwoChildViewDelegate,XHThreeChildViewDelegate,XHFourChildViewDelegate>



@property (nonatomic,strong) XCDropdownSegment *segment;

@property (nonatomic,strong) NSMutableArray *dataArr;



@end

@implementation XCTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /// 设置 UI
    [self setupUI];
}


/**
 *  设置 UI
 */
- (void)setupUI
{
    XCDropdownSegment *segment = [[XCDropdownSegment alloc] initWithFrame:CGRectMake(0,80, SCREEN_WIDTH, 40)];
    segment.dataSource = self;
    segment.delegate   = self;
    self.segment = segment;
    [self.view addSubview:segment];
    
    [segment updateConfigure:^(XCDropdownSegmentConfigure *confi) {
        confi.rowHeight = 40;
        confi.segmentHeight = 40;
        confi.sectionHeight = 40;
        confi.arrowUpImage   = ImageNamed(@"hd_btn_xlx_up");
        confi.arrowDownImage = ImageNamed(@"hd_btn_xlx_down");
        confi.headerTitleColor = [UIColor colorWithHexString:@"#333333"];
        confi.headerSelectedTitleColor = [UIColor colorWithHexString:@"#4180E9"];
    }];
    
    self.segment.oneView.delegate = self;
    self.segment.twoView.delegate = self;
    self.segment.threeView.delegate = self;
    self.segment.fourView.delegate = self;
    
    [self.segment.oneView updateDataArr:self.dataArr];
    [self.segment.twoView updateDataArr:self.dataArr];
    [self.segment.threeView updateDataArr:self.dataArr];

    
}

#pragma mark - 📕 👀 XCDropdownSegmentDataSource 👀

- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment
{
    if (2 == self.sectionCount) {
        return @[@"第一段", @"第二段"];
    }
    
    if (3 == self.sectionCount) {
        return @[@"类型",@"行业", @"区域", @"日期"];
    }
    
    return @[@"第一段"];
}


#pragma mark - 💉 👀 XCDropdownSegmentDelegate 👀

- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment didSelectHeaderInSection:(NSInteger)section
{
    NSLog(@"点击了第 %zi 段", section);
    
    
    
    
}

- (void)dropdownSegment:(XHOneChildView *)dropdownSegment
didSelectRow:(NSInteger)row
   inSection:(NSInteger)section category_id:(NSString *)miceTypeEnum category_cn_name:(NSString *)categoryName{
    NSLog(@"XHOneChildView ==  %@",categoryName);

    [self.segment updateSelectedItemTitle:categoryName];
       [self.segment close];
}

- (void)dropdownSegment:(XHTwoChildView *)dropdownSegment
            category_id:(NSString *)miceCategoryId category_cn_name:(NSString *)categoryName{
    
    NSLog(@"XHTwoChildView ==  %@",categoryName);

    [self.segment updateSelectedItemTitle:categoryName];
       [self.segment close];
}


- (void)dropdownSegment:(XHThreeChildView *)dropdownSegment
           divisionName:(NSString *)divisionName venueName:(NSString *)venueName venueId:(NSString *)venueId{
    NSLog(@"XHThreeChildView ==  %@",venueName);
    [self.segment updateSelectedItemTitle:venueName];
    [self.segment close];
}

- (void)dropdownSegment:(XHFourChildView *)dropdownSegment
               miceTime:(NSString *)miceTime{
    
    NSLog(@"XHFourChildView ==  %@",miceTime);
    
    
    [self.segment updateSelectedItemTitle:miceTime];
    [self.segment close];
}





-(NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:@[
                                         @"二：001",
                                         @"二：002",
                                         @"二：003",
                                         @"二：004",
                                         @"二：005",
                                         @"二：006",
                                         @"二：007",
                                         @"二：007",
                                         @"二：007",
                                         @"二：007"
        ]];
    }
    return _dataArr;
    
}

@end
