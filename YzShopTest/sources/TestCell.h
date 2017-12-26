//
//  TestCell.h
//  I-Young
//
//  Created by a1 on 2017/12/7.
//  Copyright © 2017年 Jack. All rights reserved.
//
#import "TestCell.h"
#import "YzWorkTools.h"
#import <UIKit/UIKit.h>

@class TestCell;

@protocol testTableViewCellDelegate <NSObject>

-(void)uodataTableViewCellHight:(TestCell*)cell andHight:(CGFloat)hight andIndexPath:(NSIndexPath *)indexPath;

-(void)PostSelectShopTypeInfo:(TestCell *)cell andIndexPath:(NSIndexPath *)indexPath content:(NSString *)content;
@end


@interface TestCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSArray *)array withIndex:(NSInteger)index;

+(instancetype)cellWithTableView :(UITableView *)tableView;
//- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)array;

@property (nonatomic , strong) NSArray *dataArr;

@property (nonatomic , strong) UICollectionView *collection;

-(CGFloat)CellHeight;

@property(nonatomic,weak) id<testTableViewCellDelegate>deleget;

@property(nonatomic,strong)NSIndexPath *indexPath;

@end
