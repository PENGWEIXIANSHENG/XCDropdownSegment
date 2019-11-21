//
//  OneView.h
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XHOneChildView;

/**
 *  代理
 */
@protocol XHOneChildViewDelegate<NSObject>
@optional

/**
 *  点击某一行的回调
 */
- (void)dropdownSegment:(XHOneChildView *)dropdownSegment
           didSelectRow:(NSInteger)row
              inSection:(NSInteger)section category_id:(NSString *)miceTypeEnum category_cn_name:(NSString *)categoryName;
@end


@interface XHOneChildView : UIView

@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) id<XHOneChildViewDelegate> delegate;



- (void)updateDataArr:(NSMutableArray *)dataArr;


@end

NS_ASSUME_NONNULL_END
