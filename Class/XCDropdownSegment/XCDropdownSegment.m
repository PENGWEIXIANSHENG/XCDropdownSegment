//
//  XCDropdownSegment.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/14.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegment.h"

#import "XCDropdownSegmentCell.h"



@interface XCDropdownSegment ()

/** 👀 蒙板 👀 */
@property (strong, nonatomic) UIButton *mask;
/** 👀 表格视图 👀 */
//@property (strong, nonatomic) UITableView *tableView;
/** 👀 头部视图 👀 */
@property (strong, nonatomic) XCDropdownSegmentBar *segmentBar;

/// 配置
@property (strong, nonatomic) XCDropdownSegmentConfigure *configure;




@end


@implementation XCDropdownSegment
{
    NSInteger _currentSection;  /// 当前显示的段
}

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置默认参数
        [self setupDefaults];
    }
    
    return self;
}

// 设置默认参数
- (void)setupDefaults
{
    /// 默认配置
    _configure = [XCDropdownSegmentConfigure defaultConfigure];
    
    /// 设置 UI
    [self setupUI];
    
    /// 配置数据
    [self reloadData];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /// 设置 mask 的 frame
    self.mask.frame = CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT);
    
    /// 设置 segmentBar 的 frame
    self.segmentBar.frame = self.bounds;
    self.segmentBar.height = self.configure.sectionHeight;
    
    /// 设置 tableView 的 frame
//    self.tableView.left  = 0;
//    self.tableView.top   = self.segmentBar.height;
//    self.tableView.width = self.width;
    
    
    self.oneView.left = 0;
    self.oneView.top  = self.segmentBar.height;
    self.oneView.width = self.width;
    
    self.twoView.left = 0;
    self.twoView.top  = self.segmentBar.height;
    self.twoView.width = self.width;
    
    self.threeView.left = 0;
    self.threeView.top  = self.segmentBar.height;
    self.threeView.width = self.width;
    
    self.fourView.left = 0;
    self.fourView.top  = self.segmentBar.height;
    self.fourView.width = self.width;
    
}

#pragma mark - ✏️ 🖼 SetupUI Method 🖼

- (void)setupUI
{
    /**
     *  视图添加结构
     *
     *  superView
        self
        maskView
        tableView
        segmentBar
     */
    
    /// 添加背景蒙板
    [self addSubview:self.mask];
    /// 添加 tableView
//    [self addSubview:self.tableView];
    [self addSubview:self.oneView];
    [self addSubview:self.twoView];
    [self addSubview:self.threeView];
    [self addSubview:self.fourView];

    /// 添加 segmentBar
    [self addSubview:self.segmentBar];
}

#pragma mark - 💤 👀 LazyLoad Method 👀

- (UIButton *)mask
{
    if (!_mask)
    {
        UIButton *maskView = [UIButton buttonWithType:UIButtonTypeCustom];
        maskView.alpha = 0;
        maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.3f];
        [maskView addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        _mask = maskView;
    }
    
    return _mask;
}

//- (UITableView *)tableView
//{
//    if (!_tableView)
//    {
//        /// 添加 tableView
//        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        tableView.delegate   = self;
//        tableView.dataSource = self;
//        tableView.tableFooterView = [UIView new];
//        _tableView = tableView;
//    }
//
//    return _tableView;
//}

- (XHOneChildView *)oneView
{
    if (!_oneView)
    {
        XHOneChildView *tableView = [[XHOneChildView alloc] initWithFrame:CGRectZero];
        _oneView = tableView;
    }

    return _oneView;
}
- (XHTwoChildView *)twoView
{
    if (!_twoView)
    {
        XHTwoChildView *tableView = [[XHTwoChildView alloc] initWithFrame:CGRectZero];
        _twoView = tableView;
    }

    return _twoView;
}
- (XHThreeChildView *)threeView
{
    if (!_threeView)
    {
        XHThreeChildView *tableView = [[XHThreeChildView alloc] initWithFrame:CGRectZero];
        _threeView = tableView;
    }

    return _threeView;
}
- (XHFourChildView *)fourView
{
    if (!_fourView)
    {
        XHFourChildView *tableView = [[XHFourChildView alloc] initWithFrame:CGRectZero];
        _fourView = tableView;
    }

    return _fourView;
}

- (XCDropdownSegmentBar *)segmentBar
{
    if (!_segmentBar)
    {
        XCDropdownSegmentBar *segmentBar = [[XCDropdownSegmentBar alloc] initWithFrame:CGRectZero];
        segmentBar.backgroundColor = [UIColor whiteColor];
//        segmentBar.layer.shadowOpacity = .2f;
//        segmentBar.layer.shadowOffset = CGSizeMake(3, 3);
//        segmentBar.layer.shadowRadius = 3;
        
        segmentBar.layer.borderWidth = 0.5;
        segmentBar.layer.borderColor = [UIColor grayColor].CGColor;
        
        /// 点击 segmentBar 上的 item 的回调
        __weak typeof(self) weakSelf = self;
        segmentBar.didClickItemCallBack = ^(XCDropdownSegmentBar *headerView, XCDropdownSegmentButton *item, NSInteger index) {
            [weakSelf didClickSegmentBarItemAction:item index:index];
        };
        _segmentBar = segmentBar;
    }
    
    return _segmentBar;
}

#pragma mark - 🛠 👀 Setter Method 👀

- (void)setDataSource:(id<XCDropdownSegmentDataSource>)dataSource
{
    _dataSource = dataSource;
    
    /// 刷新数据
    [self reloadData];
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 *  点击 segmentBar 上的 item 的回调
 *
 *  @param item    选中的 item
 *  @param index   点击的下标
 */
- (void)didClickSegmentBarItemAction:(XCDropdownSegmentButton *)item index:(NSInteger)index
{
    
    NSLog(@"didClickSegmentBarItemAction ==  %ld",index);
    NSLog(@"item.isSelected ==  %d",item.isSelected);

    /// 更新当前显示的段
    _currentSection = index;
    
    if (item.isSelected) {  /// 显示 tableView
        // 显示
        [self open];
        if (index == 1) {
            [self.twoView setupRadioBtnView];
        }
        if (index == 3) {
            [self.fourView updateSubView];
        }
        
        
        
        // 重新刷新 tableView
//        [self.tableView reloadData];
//        // 选中与标题文字相同的行
//        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[self fetchCurrentSelectedRow] inSection:0]
//                                    animated:NO
//                              scrollPosition:UITableViewScrollPositionNone];
    } else {    /// 隐藏 tableView
        [self close];
    }

    /// 回调 delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:didSelectHeaderInSection:)])
    {
        [self.delegate dropdownSegment:self didSelectHeaderInSection:index];
    }
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  获取 当前分段的 tableView 的最大高度
 */
//- (CGFloat)fetchTableViewMaxHeight
//{
//    /// 当前显示的 tableView 总行数
//    NSInteger count = [self.dataSource dropdownSegment:self titlesInSection:_currentSection].count;
//
//    /// 当前显示的 高度
//    CGFloat maxH = count * self.configure.rowHeight;
//
//    /// 允许显示的最大高度
//    CGFloat limitMaxH = self.height - self.configure.sectionHeight;
//
//    return MIN(maxH, limitMaxH);
//}

/**
 *  获取当前选中的行数
 */
//- (NSInteger)fetchCurrentSelectedRow
//{
//    NSArray *titles = [self.dataSource dropdownSegment:self titlesInSection:_currentSection];
//
//    NSString *currentTitle  = self.segmentBar.selectedItem.currentTitle;
//
//    __block NSInteger index = 0;
//    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        if ([title isEqualToString:currentTitle])
//        {
//            index = idx;
//            *stop = YES;
//        }
//    }];
//
//    return index;
//}

/**
 *  显示
 */
- (void)open
{
    [self.twoView removeSuperview];
    [self.fourView close];
    self.height = SCREEN_HEIGHT;
    /// 显示 mask、tableView
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        
        self.mask.alpha = 1.f;
//        self.tableView.height = [self fetchTableViewMaxHeight];
        self.oneView.height = 0;
        self.twoView.height = 0;
        self.threeView.height = 0;
        self.fourView.height = 0;
        
        if (_currentSection == 0) {
            self.oneView.height = SCREEN_HEIGHT *0.5;
        }
        if (_currentSection == 1) {
            self.twoView.height = SCREEN_HEIGHT *0.5;
            
        }
        if (_currentSection == 2) {
            self.threeView.height = SCREEN_HEIGHT *0.5;
        }
        if (_currentSection == 3) {
            self.fourView.height = SCREEN_HEIGHT *0.5+10;
        }
        
    }];
}

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  更新配置
 */
- (void)updateConfigure:(void(^)(XCDropdownSegmentConfigure *confi))configure
{
    if (configure) {
        configure(self.configure);
    }
    
    /// 重新刷新数据
    [self reloadData];
}

/**
 *  刷新数据
 */
- (void)reloadData
{
    /// 更新 segmentBar 的配置
    self.segmentBar.configure = self.configure;
    self.segmentBar.titles = [self.dataSource titlesOfHeaderInDropdownSegment:self];
    /// 更新 tableView 的配置
//    self.tableView.rowHeight = self.configure.rowHeight;
//    [self.tableView reloadData];
}

/**
 *  隐藏
 */
- (void)close
{
    /// 隐藏 mask、tableView
    [self.twoView removeSuperview];
    [self.fourView close];

    // 取消 item 的选中状态
    self.segmentBar.selectedItem.selected = NO;
    // 更新 item 的标题
//    NSInteger index = self.tableView.indexPathForSelectedRow.row;
//    NSArray *titles = [self.dataSource dropdownSegment:self titlesInSection:_currentSection];
//    if (titles.count > index) {
//        [self.segmentBar.selectedItem setTitle:titles[index] forState:UIControlStateNormal];
//    }
    
    // 关闭 tableView
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        
        self.mask.alpha = 0.f;
//        self.tableView.height = 0;
        self.oneView.height = 0;
        self.twoView.height = 0;
        self.threeView.height = 0;
        self.fourView.height = 0;
        self.height = self.configure.segmentHeight;
    }];
}

#pragma mark - 📕 👀 UITableViewDataSource 👀

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    NSArray *titles = [self.dataSource dropdownSegment:self titlesInSection:_currentSection];
//    return titles.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    XCDropdownSegmentCell *cell = [XCDropdownSegmentCell cellWithTableView:tableView];
//
//    cell.checkImgView.image = self.configure.checkImage;
//
//    NSArray *titles = [self.dataSource dropdownSegment:self titlesInSection:_currentSection];
//
//    if (titles.count > indexPath.row)
//    {
//        cell.titleLB.text = titles[indexPath.row];
//    }
//
//    return cell;
//}
//
//#pragma mark - 💉 👀 UITableViewDelegate 👀
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    /// 关闭 tableView
//    [self close];
//
//    /// 点击 tableView 中的某一行的回调
//    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:didSelectRow:inSection:)])
//    {
//        [self.delegate dropdownSegment:self didSelectRow:indexPath.row inSection:_currentSection];
//    }
//}


-(void)updateSelectedItemTitle:(NSString *)title{
    [self.segmentBar.selectedItem setTitle:title forState:UIControlStateNormal];
}
@end
