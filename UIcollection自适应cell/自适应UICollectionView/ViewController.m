//
//  ViewController.m
//  自适应UICollectionView
//
//  Created by 陈钦扬 on 2018/6/19.
//  Copyright © 2018年 liushuangwangluokeji. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CSCollectionCell.h"
#import "CSCollectionHeader.h"
#import "CSCollectionFooter.h"
#define CellID @"cellID"
#define HeaderID @"headerID"
#define FooterID @"footerID"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collection;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collection];
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.bounds.size.width, 30);
    }else {
        return CGSizeMake(self.view.bounds.size.width, 35);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.bounds.size.width, 30);
    }else {
        return CGSizeMake(self.view.bounds.size.width, 35);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CSCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
        [header addData:[NSString stringWithFormat:@"第个%lisection区头",indexPath.section]];
        return header;
    }else {
        CSCollectionHeader *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID forIndexPath:indexPath];
        [footer addData:[NSString stringWithFormat:@"第个%lisection区尾",indexPath.section]];
        return footer;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return CGSizeMake(80, 11);
    }
    return CGSizeMake(30, 30);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CSCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    [cell dataCell:self.dataArray[indexPath.row]];
    return cell;
}


- (UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //同一行相邻的两个cell之间的最小间距
        layout.minimumLineSpacing = 10;
        //两行之间的最小间距
        layout.minimumInteritemSpacing = 10;
        //竖直滚动
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //预估大小
        //layout.estimatedItemSize = CGSizeMake(20, 20);
        //layout.itemSize = CGSizeMake(50, 80);
        // 设置item的内边距
        layout.sectionInset = UIEdgeInsetsMake(0,0,0,0);
//        layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 35);
//        layout.footerReferenceSize = CGSizeMake(self.view.bounds.size.width, 35);
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        //去除滚动条
        _collection.showsVerticalScrollIndicator = NO;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.scrollEnabled = YES;
        //允许反弹
        _collection.bounces = YES;
        //注册cell
        [_collection registerClass:[CSCollectionCell class] forCellWithReuseIdentifier:CellID];
        [_collection registerClass:[CSCollectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
        [_collection registerClass:[CSCollectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];
    }
    return _collection;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"测试啊",@"阿斯顿发",@"啊的方式",@"阿道夫",@"公司",@"爱国",@"阿斯顿广卅",@"阿斯顿嘎嘎说的",@"萨嘎三等功",@"阿斯顿广卅的",@"电饭锅",@"电饭锅",@"阿斯顿广",@"儿童",@"测试", nil];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
