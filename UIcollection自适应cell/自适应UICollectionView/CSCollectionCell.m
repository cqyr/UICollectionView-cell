//
//  CSCollectionCell.m
//  自适应UICollectionView
//
//  Created by 陈钦扬 on 2018/6/19.
//  Copyright © 2018年 liushuangwangluokeji. All rights reserved.
//

#import "CSCollectionCell.h"
#import "Masonry.h"
@interface CSCollectionCell()
@property(nonatomic,strong) UIView *cellView;
@property(nonatomic,strong) UILabel *cellLabel;

@end
@implementation CSCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.cellView];
    [self.contentView addSubview:self.cellLabel];
    
    [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [self.cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.cellView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}

//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
//    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
//    attributes.frame = CGRectMake(0, 0, attributes.bounds.size.width, attributes.bounds.size.height);
//    return attributes;
//}

- (void)dataCell:(NSString *)strs{
    self.cellLabel.text = strs;
}

- (UIView *)cellView{
    if (!_cellView) {
        _cellView = [UIView new];
        _cellView.backgroundColor = [UIColor grayColor];
    }
    return _cellView;
}

- (UILabel *)cellLabel{
    if (!_cellLabel) {
        _cellLabel = [UILabel new];
        _cellLabel.backgroundColor = [UIColor redColor];
        _cellLabel.textAlignment = NSTextAlignmentCenter;
        _cellLabel.font = [UIFont systemFontOfSize:12];
        _cellLabel.text = @"---";
    }
    return _cellLabel;
}

@end
