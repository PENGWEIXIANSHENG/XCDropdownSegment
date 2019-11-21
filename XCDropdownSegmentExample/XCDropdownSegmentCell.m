//
//  XCDropdownSegmentCell.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegmentCell.h"


static NSString *const cellIdentifier = @"XCDropdownSegmentCell";

@implementation XCDropdownSegmentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    XCDropdownSegmentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[XCDropdownSegmentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
       
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
      
        [self.contentView addSubview:self.titleLB];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLB.frame = CGRectMake(0, 0, 100, 30);
    
//    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
//        make.left.mas_equalTo(15);
//        make.right.mas_lessThanOrEqualTo(-30);
//    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.checkImgView.hidden = !selected;
}

-(UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc]init];
        _titleLB.font = [UIFont systemFontOfSize:14];
//        _titleLB.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titleLB;
}


-(UIImageView *)checkImgView{
    
    if (!_checkImgView) {
        _checkImgView = [[UIImageView alloc]init];
        _checkImgView.contentMode = UIViewContentModeCenter;
        _checkImgView.image = [UIImage imageNamed:@"new_selected_jt"];
        _checkImgView.hidden = NO;
    }
    return _checkImgView;
}

@end
