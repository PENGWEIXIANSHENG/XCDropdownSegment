//
//  ThreeView.m
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import "XHThreeChildView.h"
#import "XCDropdownSegmentCell.h"
#import "UIView+XCDropdownSegment.h"
#import "XCDropdownSegmentHeader.h"
#import "UIColor+Hex.h"

//#import "XHActivityModel.h"

@interface XHThreeChildView ()<UITableViewDelegate,UITableViewDataSource>

// 选中的cell
@property(nonatomic ,assign) NSInteger leftSeleIndex;
@property(nonatomic ,assign) NSInteger rightSeleIndex;

@property (nonatomic,copy) NSString *divisionName;//左边城市名称
@property (nonatomic,copy) NSString *venueId;
@property (nonatomic,copy) NSString *venueName;
@property (nonatomic,strong) NSMutableArray *leftDataArr;
@property (nonatomic,strong) NSMutableArray *rightDataArr;
@end

@implementation XHThreeChildView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        self.leftDataArr = [NSMutableArray array];
        self.rightDataArr = [NSMutableArray array];
        self.divisionName = @"";
        self.venueId = @"";
        self.venueName = @"";

        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
        
    }
    return self;
}

/// 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.leftTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH/3, self.height);
    
    self.rightTableView.frame = CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH - SCREEN_WIDTH/3, self.height);
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.leftDataArr.count;
    }
    return self.rightDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XCDropdownSegmentCell *cell = [XCDropdownSegmentCell cellWithTableView:tableView];
    
    
    if (tableView == self.leftTableView) {

        NSString *divisionName = self.leftDataArr[indexPath.row];
        cell.titleLB.text = divisionName;
        if (indexPath.row == self.leftSeleIndex) {
               cell.titleLB.textColor = [UIColor colorWithHexString:@"#4180E9"];
           }else{
               cell.titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
           }
    }else if (tableView == self.rightTableView){

        NSString *venueName = self.rightDataArr[indexPath.row];

        cell.titleLB.text = venueName;
        if (indexPath.row == self.rightSeleIndex) {
               cell.titleLB.textColor = [UIColor colorWithHexString:@"#4180E9"];
           }else{
               cell.titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
           }
    }
    
    return cell;
}

#pragma mark - 💉 👀 UITableViewDelegate 👀

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.leftTableView) {

        [self.rightDataArr removeAllObjects];

        self.leftSeleIndex = indexPath.row;
        self.rightSeleIndex = 0;

        NSString *divisionName = [self.leftDataArr objectAtIndex:indexPath.row];
        self.divisionName = divisionName;

        [self updateRightTableViewDataArr];

        self.venueId = @"";
        self.venueName = @"";

        [self.leftTableView reloadData];
        [self.rightTableView reloadData];

    }else if (tableView == self.rightTableView){
        
        self.rightSeleIndex = indexPath.row;
     
        NSString *divisionName = [self.rightDataArr objectAtIndex:indexPath.row];
        
        self.venueName = divisionName;
        
        [self.rightTableView reloadData];

        if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:divisionName:venueName:venueId:)])
          {
              [self.delegate dropdownSegment:self divisionName:self.divisionName venueName:self.venueName venueId:self.venueId];
          }
    }
    
}

- (void)updateDataArr:(NSMutableArray *)dataArr{
    NSLog(@"dataArr ===  %@",dataArr);
    self.leftSeleIndex = 0;
    self.rightSeleIndex = 0;
    
    [self.rightDataArr removeAllObjects];
    [self.leftDataArr removeAllObjects];
    [self updateRightTableViewDataArr];
    self.leftDataArr = dataArr;
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];
}


- (void)updateRightTableViewDataArr{

    self.rightDataArr = [NSMutableArray arrayWithArray:@[@"haha",@"heheh",@"heiheihei"]];

}


-(UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.showsVerticalScrollIndicator = NO;
    }
    return _leftTableView;
}
-(UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.showsVerticalScrollIndicator = NO;
    }
    return _rightTableView;
}

@end
