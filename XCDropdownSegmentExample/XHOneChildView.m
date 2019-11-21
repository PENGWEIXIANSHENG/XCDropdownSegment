//
//  OneView.m
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import "XHOneChildView.h"
#import "UIView+XCDropdownSegment.h"
#import "XCDropdownSegmentCell.h"
#import "UIColor+Hex.h"
//#import "XHActivityModel.h"

@interface XHOneChildView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataArr;

@property(nonatomic ,assign) NSInteger selectedRow;

@end


@implementation XHOneChildView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        self.dataArr = [NSMutableArray array];
        [self addSubview:self.tableView];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /// 设置 tableView 的 frame
    self.tableView.left  = 0;
    self.tableView.top   = 0;
    self.tableView.width = self.width;
    self.tableView.height = self.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XCDropdownSegmentCell *cell = [XCDropdownSegmentCell cellWithTableView:tableView];

    
    NSString *title = self.dataArr[indexPath.row];

        cell.titleLB.text = title;

    if (indexPath.row == self.selectedRow) {
           cell.titleLB.textColor = [UIColor colorWithHexString:@"#4180E9"];
       }else{
           cell.titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
       }
    
    return cell;
}

#pragma mark - 💉 👀 UITableViewDelegate 👀

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.selectedRow = indexPath.row;
    [self.tableView reloadData];

     NSString *category_cn_name = [self.dataArr objectAtIndex:indexPath.row];
//
    /// 点击 tableView 中的某一行的回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:didSelectRow:inSection: category_id:category_cn_name:)])
    {
        [self.delegate dropdownSegment:self didSelectRow:indexPath.row inSection:indexPath.section category_id:category_cn_name category_cn_name:category_cn_name];
    }
}

- (void)updateDataArr:(NSMutableArray *)dataArr{
    NSLog(@"dataArr ===  %@",dataArr);
    self.dataArr = dataArr;
    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        /// 添加 tableView
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate   = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
    }
    return _tableView;
}
@end
