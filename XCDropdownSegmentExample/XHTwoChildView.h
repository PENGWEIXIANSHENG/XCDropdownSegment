//
//  TwoView.h
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XHTwoChildView;

/**
 *  代理
 */
@protocol XHTwoChildViewDelegate<NSObject>
@optional

/**
 *  点击某一行的回调
 */
- (void)dropdownSegment:(XHTwoChildView *)dropdownSegment
            category_id:(NSString *)miceCategoryId category_cn_name:(NSString *)categoryName;
@end





@interface XHTwoChildView : UIView
@property (weak, nonatomic) id<XHTwoChildViewDelegate> delegate;
-(void)updateDataArr:(NSMutableArray *)dataArray;
- (void)setupRadioBtnView;
-(void)removeSuperview;
@end

NS_ASSUME_NONNULL_END
