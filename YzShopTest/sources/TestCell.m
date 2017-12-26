//
//  TestCell.m
//  I-Young
//
//  Created by a1 on 2017/12/7.
//  Copyright © 2017年 Jack. All rights reserved.
//
#import "ShopTypeDetailCell.h"
#import "TestCell.h"
#import "Masonry.h"

@interface TestCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic , assign) NSInteger index;

@property(nonatomic,assign)CGFloat hightED;

@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSArray *)array withIndex:(NSInteger)index{
    
//    NSLog(@"array  ------   %@",array);

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
       
        self.dataArr = array;
        
        self.index   = index;
        
        self.hightED = 0.0;
        
        [self setupUI];

        [self updateConstraints];

    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        [self setupUI];
        
        [self updateConstraints];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    [self performSelector:@selector(Reoad) withObject:nil afterDelay:0];

}
-(void)Reoad{
   
    CGFloat height = self.collection.collectionViewLayout.collectionViewContentSize.height;
    
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.with.bottom.with.left.with.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(height);
    }];
}

-(UICollectionView *)collection{
    if (!_collection) {
        
        UICollectionViewFlowLayout  *layout = [[UICollectionViewFlowLayout alloc] init];
        //    layout.collectionViewContentSize.height =
        // 设置具体属性
        // 1.设置 最小行间距
        
        layout.minimumLineSpacing = 10;
//        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
        // 2.设置 最小列间距
        layout.minimumInteritemSpacing  = 5;
        // 3.设置item块的大小 (可以用于自适应)
//        layout.estimatedItemSize = CGSizeMake(YzWidth/4, 30);
        layout.itemSize = CGSizeMake(YzWidth/4-20, 30);

        // 设置滑动的方向 (默认是竖着滑动的)
        layout.scrollDirection =  UICollectionViewScrollDirectionVertical;
        
        //    [layout prepareLayout];
        // 设置item的内边距
        layout.sectionInset = UIEdgeInsetsMake(5,10,5,10);
        
        self.collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];

        [self.collection registerClass:[ShopTypeDetailCell class] forCellWithReuseIdentifier:@"ShopTypeDetailCell"];
        
        self.collection.backgroundColor = [UIColor whiteColor];
        //    self.collection.translatesAutoresizingMaskIntoConstraints = NO;
        self.collection.delegate = self;
        self.collection.dataSource = self;
        self.collection.bounces = NO;
        self.collection.scrollEnabled = NO;
        
    }
    return _collection;
}

-(void)setupUI{
    
    [self.contentView addSubview:self.collection];
    
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.with.left.with.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(@40);
    }];

    
    CGFloat height = self.collection.collectionViewLayout.collectionViewContentSize.height;
//
    NSLog(@"\n\n\n 高度  1   -----------      %.f \n\n\n\n",height);

}

-(CGFloat)CellHeight
{
    return self.collection.collectionViewLayout.collectionViewContentSize.height;
}

#pragma MARK --- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopTypeDetailCell *cell = [ShopTypeDetailCell recommendCellWithCollectionView:collectionView indePath:indexPath];
    
    [cell configCellWithTitle:self.dataArr[indexPath.row][@"specValue"]];
   
    [cell upDataSubViewTextColor:RGBACOLOR(0, 0, 0, 0.6) BGColor:RGBColor(230, 230, 230)];
    
//    if (indexPath.row == self.dataArr.count -1) {
        [self updateCollectionViewHight:self.collection.collectionViewLayout.collectionViewContentSize.height];
//    }
    
    return cell;
}

-(void)updateCollectionViewHight:(CGFloat)hight
{
    
//    NSLog(@" higet    ---- - - - -- - - - - - - - - - - - - - - - -   %f",++hight);
    if (self.hightED != hight)
    {
        self.hightED = hight;
        
        [self.collection mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(hight);
        }];
        
        if (_deleget && [_deleget respondsToSelector:@selector(uodataTableViewCellHight:andHight:andIndexPath:)]) {
            [self.deleget uodataTableViewCellHight:self andHight:hight andIndexPath:self.indexPath];
        }
        
    }

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        for (int i =0 ; i<self.dataArr.count; i ++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
            ShopTypeDetailCell *cell = [self.collection cellForItemAtIndexPath:index];
            [cell upDataSubViewTextColor:RGBACOLOR(0, 0, 0, 0.6) BGColor:RGBColor(230, 230, 230)];
        }
    ShopTypeDetailCell *cell = [self.collection  cellForItemAtIndexPath:indexPath];
    [cell upDataSubViewTextColor:[UIColor whiteColor] BGColor:RGBColor(255, 103, 143)];


//    NSLog(@"%@",self.dataArr[indexPath.row][@"specValue"]);

    if ([self.deleget respondsToSelector:@selector(PostSelectShopTypeInfo:andIndexPath:content:)]) {
        
        [self.deleget PostSelectShopTypeInfo:self  andIndexPath:indexPath content:self.dataArr[indexPath.row][@"specValue"]];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *cellID = @"TestCell";
    
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return cell;
}

//- (CGFloat) collectionView:(UICollectionView *)collectionView
//                    layout:(UICollectionViewLayout *)collectionViewLayout
//minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5;
//}

@end
