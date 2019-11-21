//
//  ThreeView.h
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XHThreeChildView;
/**
 *  代理
 */
@protocol XHThreeChildViewDelegate<NSObject>
@optional

/**
 *  点击某一行的回调
 */
- (void)dropdownSegment:(XHThreeChildView *)dropdownSegment
            divisionName:(NSString *)divisionName venueName:(NSString *)venueName venueId:(NSString *)venueId;
@end

@interface XHThreeChildView : UIView


@property (weak, nonatomic) id<XHThreeChildViewDelegate> delegate;

@property(nonatomic ,strong) UITableView    *leftTableView;
@property(nonatomic ,strong) UITableView    *rightTableView;

- (void)updateDataArr:(NSMutableArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
