//
//  ShopTypeDetailCell.h
//  I-Young
//
//  Created by a1 on 2017/12/6.
//  Copyright © 2017年 Jack. All rights reserved.
//
#import "YzWorkTools.h"
#import <UIKit/UIKit.h>

@interface ShopTypeDetailCell : UICollectionViewCell

@property (nonatomic , strong) UILabel *selectBtn;

-(void)configCellWithTitle:(NSString*)title;

-(void)upDataSubViewTextColor:(UIColor *)color BGColor:(UIColor *)color;

+(instancetype)recommendCellWithCollectionView:(UICollectionView*)CollectionView indePath:(NSIndexPath *)indePath;

@end
