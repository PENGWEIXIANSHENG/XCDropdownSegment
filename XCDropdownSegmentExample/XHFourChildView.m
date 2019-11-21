//
//  FourView.m
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import "XHFourChildView.h"
#import "CalendarConfig.h"
#import "MCalendarView.h"
#import "MCalendarShortView.h"
#import "MCalendarTitleView.h"
#import "UIColor+Hex.h"
#import "MCalendarFramework.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
@interface XHFourChildView()

@property (nonatomic, strong) MCalendarView *calendarView;
@property (nonatomic, strong) MCalendarShortView *calendarShortView;
@property (nonatomic, strong) MCalendarTitleView *titleView;

@property (nonatomic,strong) UIView *backgroundView;

@end

@implementation XHFourChildView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor blueColor];
        [CalendarConfig sharedInstance].textColor = [UIColor colorWithHexString:@"#333333"];
        [CalendarConfig sharedInstance].selectTextColor = [UIColor colorWithHexString:@"#333333"];
        [CalendarConfig sharedInstance].backgroundColor = [UIColor whiteColor];

        [CalendarConfig sharedInstance].todayTextColor = [UIColor blackColor];
        [CalendarConfig sharedInstance].todaySelectedTextColor = [UIColor colorWithHexString:@"#FFFFFF"];
        [CalendarConfig sharedInstance].todayBackgroundColor = [UIColor colorWithHexString:@"#4180E9"];

        [CalendarConfig sharedInstance].outBackgroundColor = [UIColor whiteColor];
        [CalendarConfig sharedInstance].selectBackgroundColor = [UIColor colorWithHexString:@"#4180E9"];
        
        
        [self setUpAllView];
    }
    return self;
}

-(void)setUpAllView{

    self.backgroundView = [[ UIView alloc] init];
    self.backgroundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT *0.5+10);
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backgroundView];
    
    NSArray *wekdayArr = @[@"全部时间",@"本周",@"本月"];
    CGFloat width = 80;
    CGFloat height = 30;
    CGFloat btnY = 20;
    CGFloat btnX = 10;
    for (NSInteger i = 0; i < wekdayArr.count; i++) {
        UIButton *wekdayBtn = [[UIButton alloc] init];
        [self.backgroundView addSubview:wekdayBtn];
        wekdayBtn.frame  = CGRectMake(btnX + (width + btnX)*i, btnY, width, height);
        [wekdayBtn setTitle:wekdayArr[i] forState:UIControlStateNormal];
        [wekdayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        wekdayBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        wekdayBtn.layer.masksToBounds = YES;
        wekdayBtn.layer.cornerRadius = 5;
        wekdayBtn.layer.borderWidth = 0.5;
        wekdayBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [wekdayBtn addTarget:self action:@selector(weekdayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    _calendarView = [[MCalendarView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 500)];
    _calendarView.backgroundColor = [UIColor whiteColor];
    _calendarView.startDate = self.calendarView.selectedDate = [NSDate date];
    _calendarView.enableAutoDismiss = NO;
    __weak typeof(self) weakSelf = self;
    _calendarView.block = ^(NSDate *date) {

        weakSelf.calendarView.selectedDate = date;
        [weakSelf SelectedWithMiceTime:date];
    };
    
    [self.backgroundView addSubview:self.calendarView];
    
    self.backgroundView.hidden = YES;
    
}

/**
*  显示
*/
- (void)updateSubView{
    self.backgroundView.hidden = NO;
}

/**
 *  隐藏
 */
- (void)close{
    self.backgroundView.hidden = YES;
}



-(void)SelectedWithMiceTime:(NSDate *)date{
    
    NSLog(@"date ===  %@",date);
    
    NSInteger year = [date year];
    NSInteger month = [date month];
    NSInteger day = [date day];
    NSLog(@"year == %ld month == %ld == %ld",(long)year,month,day);
    
    NSString *MONTH = @"";
    NSString *DAY = @"";
    
    if (month < 10) {
        MONTH = [NSString stringWithFormat:@"0%ld",(long)month];
    }else{
        MONTH = [NSString stringWithFormat:@"%ld",(long)month];
    }
    
    if (day < 10) {
        DAY = [NSString stringWithFormat:@"0%ld",(long)day];
    }else{
        DAY = [NSString stringWithFormat:@"%ld",(long)day];
    }
    NSString *miceTime = [NSString stringWithFormat:@"%ld-%@-%@",(long)year,MONTH,DAY];
    
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:miceTime:)]) {
        [self.delegate dropdownSegment:self miceTime:miceTime];
    }
}


-(void) weekdayBtnClick:(UIButton *) btn{
    
    NSLog(@" btntext ===  %@",btn.titleLabel.text);

    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:miceTime:)]) {
        [self.delegate dropdownSegment:self miceTime:btn.titleLabel.text];
    }
}

-(void) removeSubViews{
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self.calendarView removeFromSuperview];
}



@end
