//
//  ViewController.m
//  YzShopTest
//
//  Created by a1 on 2017/12/26.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingDetailView.h"
#import "shopTypeModel.h"


@interface ViewController ()<ShoppingDetailViewDelegate>

@property (nonatomic , strong) ShoppingDetailView *DetailView;
@property (nonatomic , strong) UIView *FootActionView;
@property (nonatomic , strong) NSArray *specsArray;
@property (nonatomic , strong) NSMutableArray *shopTypeArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.specsArray = @[
  @{
      @"spec":@"颜色",
      @"specValues":@[@{@"specValue":@"红色"},@{@"specValue":@"红色"},@{@"specValue":@"红色"}]
    },
  @{
      @"spec":@"规格",
    @"specValues":@[@{@"specValue":@"vvvvv"},@{@"specValue":@"vvvvv"},@{@"specValue":@"vvvvv"},@{@"specValue":@"vvvvv"},@{@"specValue":@"vvvvv"}]
      },
  @{
      @"spec":@"尺寸",
      @"specValues":@[@{@"specValue":@"xxl"},@{@"specValue":@"xxl"},@{@"specValue":@"xxl"},@{@"specValue":@"xxl"},@{@"specValue":@"xxl"},@{@"specValue":@"xxl"},@{@"specValue":@"xxl"}]
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FootActionView];

}

//选中的选项
-(void)shopModelSelectDetail:(NSString *)content Indexpath:(NSInteger)indexpath
{
    
    shopTypeModel *model = [shopTypeModel new];
    model.title = content;
    model.indexpath = indexpath;
    self.shopTypeArray[indexpath] = model;
    NSLog(@"%@------%ld 区",content,(long)indexpath);
}

-(UIView*)FootActionView
{
    if (!_FootActionView) {
        UIView *footView = [UIView new];
        footView.frame = CGRectMake(0, YzHeight -44 , YzWidth, 44);
        if (IphoneX) {
            footView.frame = CGRectMake(0, YzHeight -44 -44 , YzWidth, 44);
        }
        footView.backgroundColor = [UIColor orangeColor];
        NSArray *titleArray = @[@"客服",@"收藏",@"加入购物车",@"立即购买"];
        for (int i = 0; i<4 ; i ++) {
            
            UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            actionBtn.tag = i;
            [actionBtn setTitle:titleArray[i] forState:UIControlStateNormal];
            actionBtn.backgroundColor = [UIColor whiteColor];
            actionBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [actionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            if (i <2) {
                actionBtn.frame = CGRectMake(YzWidth/6*i, 0, YzWidth/6-1, 44);
            }else{
                actionBtn.frame = CGRectMake(YzWidth/3*(i-1) , 0, YzWidth/3-1, 44);
                
                if (i == 3) {
                    actionBtn.backgroundColor = RGBColor(255, 103, 143);
                    [actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                }
            }
            [actionBtn addTarget:self action:@selector(JumpToSure:) forControlEvents:UIControlEventTouchUpInside];
            [footView addSubview:actionBtn];
            
        }
        //        [self.view addSubview:footView];
        _FootActionView = footView;
    }
    return _FootActionView;
}

-(ShoppingDetailView *)DetailView{
    
    if (!_DetailView) {
        _DetailView = [[ShoppingDetailView alloc]initWithFrame:CGRectMake(0, YzHeight, YzWidth, YzWidth) titles:self.specsArray shoppingInfo:nil];
        _DetailView.delegate = self;
        [self.view addSubview:_DetailView];
        
    }
    return _DetailView;
}

//加入购物车
-(void)ShoppingSelect:(id)view
{
    [UIView animateWithDuration:.5 animations:^{
        self.DetailView.frame = CGRectMake(0, YzHeight-YzWidth, YzWidth, YzWidth);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.3 animations:^{
            self.DetailView.frame = CGRectMake(0, 50+YzHeight, YzWidth, YzWidth);
        }];
    }];
}
//收起动画
-(void)JumpToSure:(UIButton *)sender{
    
    [UIView animateWithDuration:.1 animations:^{
        self.DetailView.frame = CGRectMake(0, 50+YzHeight, YzWidth, YzWidth);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.3 animations:^{
            self.DetailView.frame = CGRectMake(0, YzHeight-YzWidth, YzWidth, YzWidth);
        }];
    }];
}

-(NSMutableArray *)shopTypeArray
{
    if (!_shopTypeArray) {
        _shopTypeArray = [NSMutableArray array];
        
        for (int i = 0 ; i<self.specsArray.count; i ++) {
            [_shopTypeArray addObject:@""];
        }
    }
    return _shopTypeArray;
}


@end
