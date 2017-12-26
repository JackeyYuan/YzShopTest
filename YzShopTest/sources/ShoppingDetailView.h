//
//  ShoppingDetailView.h
//  I-Young
//
//  Created by a1 on 2017/12/6.
//  Copyright © 2017年 Jack. All rights reserved.
//
#import "YzWorkTools.h"
#import <UIKit/UIKit.h>
//#import "ShoppingModel.h"

@class ShoppingDetailView;

@protocol ShoppingDetailViewDelegate <NSObject>
-(void)shopModelSelectDetail:(NSString *)content Indexpath:(NSInteger)indexpath;
@optional

-(void)ShoppingSelect:(id)view;

@end

@interface ShoppingDetailView : UIView

//商品信息
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles shoppingInfo:(NSDictionary *)info;

@property (nonatomic , weak) id <ShoppingDetailViewDelegate>delegate;

@property (nonatomic , strong) UIImageView *goodsImage;

@property (nonatomic , strong) UILabel *goodsColor;

@property (nonatomic , strong) UILabel *goodsPrice;

@property (nonatomic , strong) UILabel *goodsType;

@property (nonatomic , strong) NSArray *typeArray;

@property (nonatomic,strong) UIButton *doneBtn;

@end
