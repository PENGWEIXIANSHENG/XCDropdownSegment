//
//  XCDropdownSegment.h
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/14.
//  Copyright © 2017年 樊小聪. All rights reserved.
//



/*
 *  备注：封装下拉列表 🐾
 */



#import <UIKit/UIKit.h>

#import "XCDropdownSegmentBar.h"
#import "XHOneChildView.h"
#import "XHTwoChildView.h"
#import "XHThreeChildView.h"
#import "XHFourChildView.h"

@class XCDropdownSegment;

/**
 *  数据源
 */
@protocol XCDropdownSegmentDataSource<NSObject>
@required
/**
 *  段头标题显示的文字
 */
- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment;



@end


/**
 *  代理
 */
@protocol XCDropdownSegmentDelegate<NSObject>
@optional
/**
 *  点击头部的回调
 */
- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment
    didSelectHeaderInSection:(NSInteger)section;

@end



@interface XCDropdownSegment : UIView


@property (strong, nonatomic) XHOneChildView *oneView;
@property (strong, nonatomic) XHTwoChildView *twoView;
@property (strong, nonatomic) XHThreeChildView *threeView;
@property (strong, nonatomic) XHFourChildView *fourView;

@property (weak, nonatomic) id<XCDropdownSegmentDataSource> dataSource;
@property (weak, nonatomic) id<XCDropdownSegmentDelegate> delegate;


/**
 *  更新配置
 */
- (void)updateConfigure:(void(^)(XCDropdownSegmentConfigure *confi))configure;

/**
*  更新选中标题
*/
-(void)updateSelectedItemTitle:(NSString *)title;


/**
 *  刷新数据
 */
- (void)reloadData;

/**
 *  隐藏
 */
- (void)close;

@end
