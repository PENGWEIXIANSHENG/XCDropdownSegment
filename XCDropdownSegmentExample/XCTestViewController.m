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
    XCDropdownSegment *segment = [[XCDropdownSegment alloc] initWithFrame:CGRectMake(0,40+10, SCREEN_WIDTH, 40)];
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
}

#pragma mark - 📕 👀 XCDropdownSegmentDataSource 👀

- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment
{
    if (2 == self.sectionCount) {
        return @[@"第一段", @"第二段"];
    }
    
    if (3 == self.sectionCount) {
        return @[@"第一段", @"第二段", @"第三段"];
    }
    
    return @[@"第一段"];
}

- (NSArray<NSString *> *)dropdownSegment:(XCDropdownSegment *)dropdownSegment titlesInSection:(NSInteger)section
{
    if (0 == section)   return @[@"一：001", @"一：002", @"一：003"];
    
    if (1 == section)   return @[
                                 @"二：001",
                                 @"二：002",
                                 @"二：003",
                                 @"二：004",
                                 @"二：005",
                                 @"二：006",
                                 @"二：007"
                                 ];
    return @[
             @"三：001",
             @"三：002",
             @"三：003",
             @"三：004",
             @"三：005"
             ];
}

#pragma mark - 💉 👀 XCDropdownSegmentDelegate 👀

- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment didSelectHeaderInSection:(NSInteger)section
{
    NSLog(@"点击了第 %zi 段", section);
    
    
}

- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment didSelectRow:(NSInteger)row inSection:(NSInteger)section
{
    NSLog(@"点击了第 %zi 段的第 %zi 行", section, row);
    
    
}

@end
