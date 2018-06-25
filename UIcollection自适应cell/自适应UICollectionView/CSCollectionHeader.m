//
//  CSCollectionHeader.m
//  自适应UICollectionView
//
//  Created by 陈钦扬 on 2018/6/20.
//  Copyright © 2018年 liushuangwangluokeji. All rights reserved.
//

#import "CSCollectionHeader.h"
#import "Masonry.h"
@interface CSCollectionHeader()
@property(nonatomic,strong) UILabel *label;
@end
@implementation CSCollectionHeader
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (void)addData:(NSString *)strs{
    self.label.text = strs;
}

- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12];
        _label.text = @"---";
    }
    return _label;
}
@end
