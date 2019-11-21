//
//  FourView.h
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@class XHFourChildView;
/**
 *  代理
 */
@protocol XHFourChildViewDelegate<NSObject>
@optional

/**
 *  点击某一行的回调
 */
- (void)dropdownSegment:(XHFourChildView *)dropdownSegment
            miceTime:(NSString *)miceTime;
@end


@interface XHFourChildView : UIView

@property (weak, nonatomic) id<XHFourChildViewDelegate> delegate;


/**
*  显示
*/
- (void)updateSubView;

/**
 *  隐藏
 */
- (void)close;
@end

NS_ASSUME_NONNULL_END
