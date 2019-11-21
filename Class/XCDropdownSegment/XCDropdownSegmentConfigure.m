//
//  XCDropdownSegmentConfigure.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/15.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegmentConfigure.h"
#import "XCDropdownSegmentHeader.h"
#import "UIColor+Hex.h"

@implementation XCDropdownSegmentConfigure

+ (instancetype)defaultConfigure
{
    XCDropdownSegmentConfigure *config = [[XCDropdownSegmentConfigure alloc] init];
    
    config.sectionHeight = 50;
    config.rowHeight     = 50;
    config.segmentHeight = 40;
    config.arrowUpImage   = ImageNamed(@"hd_btn_xlx_up");
    config.arrowDownImage = ImageNamed(@"hd_btn_xlx_down");
    config.checkImage = ImageNamed(@"icon_check");
    
    config.headerTitleColor = [UIColor colorWithHexString:@"#333333"];
    config.headerSelectedTitleColor = [UIColor colorWithHexString:@"#4180E9"];
    config.headerTitleFontSize = 13;
    
    config.rowTitleColor = [UIColor blackColor];
    config.rowSelectedTitleColor = [UIColor orangeColor];
    config.rowTitleFontSize = 15;
    
    return config;
}

static inline UIImage *ImageNamed(NSString *imageName)
{
    NSInteger scale = [UIScreen mainScreen].scale;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:NSClassFromString(@"XCDropdownSegment")];
    NSString *bundleName = @"XCDropdownSegment.bundle";
    NSString *imagePath  = [currentBundle pathForResource: [NSString stringWithFormat:@"%@@%zdx", imageName, scale] ofType:@"png" inDirectory:bundleName];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
