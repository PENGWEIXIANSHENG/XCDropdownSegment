//
//  ThreeView.m
//  XCDropdownSegmentExample
//
//  Created by power on 2019/10/8.
//  Copyright © 2019 樊小聪. All rights reserved.
//

#import "XHThreeChildView.h"
#import "XCDropdownSegmentCell.h"
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
//@property (nonatomic,strong) NSMutableArray *allDataArr;
@end

@implementation XHThreeChildView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor yellowColor];
        
        self.leftDataArr = [NSMutableArray array];
        self.rightDataArr = [NSMutableArray array];
        self.divisionName = @"";
        self.venueId = @"";
        self.venueName = @"";

//        self.allDataArr = [NSMutableArray array];
        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
        
    }
    return self;
}

/// 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
//    CGRectMake(0, 0, kScreenWidth/2 - 15, 0)
//    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.mas_equalTo(0);
//        make.width.mas_equalTo(kScreenWidth/3);
//    }];
//
//    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.leftTableView.mas_right);
//        make.top.bottom.right.mas_equalTo(0);
//    }];
    
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
    
    
//    if (tableView == self.leftTableView) {
//        XHActivityModel *model = [self.leftDataArr safeObjectAtIndex:indexPath.row];
//        cell.titleLB.text = model.divisionName;
//        if (indexPath.row == self.leftSeleIndex) {
//               cell.titleLB.textColor = [UIColor colorWithHexString:@"#4180E9"];
//           }else{
//               cell.titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
//           }
//    }else if (tableView == self.rightTableView){
//
//        XHActivityModel *model = [self.rightDataArr safeObjectAtIndex:indexPath.row];
//        cell.titleLB.text = model.venueName;
//        if (indexPath.row == self.rightSeleIndex) {
//               cell.titleLB.textColor = [UIColor colorWithHexString:@"#4180E9"];
//           }else{
//               cell.titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
//           }
//    }
    
    return cell;
}

#pragma mark - 💉 👀 UITableViewDelegate 👀

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if (tableView == self.leftTableView) {
//
//        [self.rightDataArr removeAllObjects];
//
//        self.leftSeleIndex = indexPath.row;
//        self.rightSeleIndex = 0;
//
//        XHActivityModel *model = [self.leftDataArr safeObjectAtIndex:indexPath.row];
//        self.divisionName = model.divisionName;
//
//        XHActivityModel *divisionModel = [[XHActivityModel alloc]init];
//        divisionModel.venueName = @"全部";
//        divisionModel.venueId = @"";
//        [self.rightDataArr addObject:divisionModel];
//
//        if ([model.divisionName isEqualToString:@"全部"]) {
//            for (XHActivityModel *model in self.leftDataArr) {
//                [self updateRightTableViewDataArr:model];
//            }
//        }else{
//            [self updateRightTableViewDataArr:model];
//        }
//
//        self.venueId = @"";
//        self.venueName = @"";
//
//        [self.leftTableView reloadData];
//        [self.rightTableView reloadData];
//
//    }else if (tableView == self.rightTableView){
//        self.rightSeleIndex = indexPath.row;
//        XHActivityModel *model = [self.rightDataArr safeObjectAtIndex:indexPath.row];
//
//        QMUILog(@"",@"didSelectRowAtIndexPath ==  model.venueName ==%@",model.venueName);
//        QMUILog(@"",@"didSelectRowAtIndexPath ==  model.venueId == %@",model.venueId);
//
//        if (!ValidStr(self.divisionName)) {
//            self.divisionName = @"全部";
//        }
//
//        self.venueId = model.venueId;
//        self.venueName = model.venueName;
//        [self.rightTableView reloadData];
//
//        if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownSegment:divisionName:venueName:venueId:)])
//          {
//              [self.delegate dropdownSegment:self divisionName:self.divisionName venueName:self.venueName venueId:self.venueId];
//          }
//    }
    
}

- (void)updateDataArr:(NSMutableArray *)dataArr{
    NSLog(@"dataArr ===  %@",dataArr);
    self.leftSeleIndex = 0;
    self.rightSeleIndex = 0;
    [self.rightDataArr removeAllObjects];
    [self.leftDataArr removeAllObjects];
//    [self.allDataArr removeAllObjects];
    
//    XHActivityModel *divisionModel = [[XHActivityModel alloc]init];
//    divisionModel.venueName = @"全部";
//    divisionModel.venueId = @"";
//    [self.rightDataArr addObject:divisionModel];
//    
//    for (XHActivityModel *model in dataArr) {
//        [self updateRightTableViewDataArr:model];
//    }

    self.leftDataArr = dataArr;
//    self.allDataArr = self.rightDataArr;
    
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];
}


//- (void)updateRightTableViewDataArr:(XHActivityModel *)model{
//
//    for (NSDictionary *item in model.miceVenueList) {
//        XHActivityModel *miceVenueModel = [XHActivityModel modelWithDictionary:item];
//        [self.rightDataArr addObject:miceVenueModel];
//    }
//
//}


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
