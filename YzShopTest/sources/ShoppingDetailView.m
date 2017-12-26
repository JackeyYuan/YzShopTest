//
//  ShoppingDetailView.m
//  I-Young
//
//  Created by a1 on 2017/12/6.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "ShopTypeDetailCell.h"
#import "ShoppingDetailView.h"
#import "Masonry.h"
//商品规格详情
#import "TestCell.h"
@interface ShoppingDetailView ()<UITableViewDelegate,UITableViewDataSource,testTableViewCellDelegate>

@property (nonatomic,strong) UICollectionView *collection;
@property (nonatomic,strong) NSMutableArray   *data;
@property (nonatomic,strong) UITableView      *MainTableView;
@property (nonatomic ,assign) CGFloat CellHeight;
@property (nonatomic ,assign) NSInteger index;
@property(nonatomic,strong)NSMutableDictionary *dicH;
@end

@implementation ShoppingDetailView


- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles shoppingInfo:(NSDictionary *)info{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor whiteColor];
        
        self.data = [titles mutableCopy];
        
        [self setTableViewLayout];
    
//        UIView *whiteView = [UIView new];
//        whiteView.frame = CGRectMake(0, 0, YzWidth, YzWidth/24);
//        whiteView.backgroundColor = [UIColor whiteColor];
//        [self addSubview:whiteView];

//        UIImageView *logoImag = [UIImageView new];
//        logoImag.frame = CGRectMake(YzWidth/20,-YzWidth/8-YzWidth/12, YzWidth/4, YzWidth/4);
//        logoImag.image = [UIImage imageNamed:@"gbtTest.jpg"];
//        [self addSubview:logoImag];
    }
    return self;
}
-(void)setTableViewLayout{
    
    _MainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YzWidth, YzWidth-44) style:UITableViewStyleGrouped];
    if (IphoneX) {
        _MainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YzWidth, YzWidth-44) style:UITableViewStyleGrouped];
    }
    if (@available(ios 11.0, *)) {
        _MainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _MainTableView.backgroundColor = [UIColor whiteColor];
    _MainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _MainTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _MainTableView.delegate = self;
    _MainTableView.dataSource = self;
    _MainTableView.rowHeight = UITableViewAutomaticDimension;
    _MainTableView.estimatedRowHeight = 80;
//    [_MainTableView registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];

    [self addSubview:self.MainTableView];
   
    self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.doneBtn.frame = CGRectMake(0, YzWidth-44, YzWidth, 44);
    [self.doneBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.doneBtn setTintColor:[UIColor whiteColor]];
    self.doneBtn.backgroundColor =RGBColor(255, 103, 143);
    [self.doneBtn addTarget:self action:@selector(JumPhidenBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.doneBtn];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (!cell){
        NSLog(@"\n\n\n    开始   创建  cell \n\n\n\n\n");
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestCell" withArray:self.data[indexPath.section][@"specValues"] withIndex:indexPath.section];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        cell.deleget = self;
        cell.tag = indexPath.section;
        cell.indexPath = indexPath;
    }
    return cell;
}

//tableview 加载完成可以调用的方法--因为tableview的cell高度不定，所以在加载完成以后重新计算高度
//-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    [cell layoutSubviews];
//    
//    NSLog(@"\n\n\n\n\n  cell   创建完成 ---------------  %.f\n\n\n\n\n",cell.contentView.frame.size.height);
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dicH[indexPath]) {
        NSNumber *num = self.dicH[indexPath];
        return [num floatValue];
//    }else{
//        return 44;
//    }
}

- (void)configureCell:(TestCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.dataArr = self.data[indexPath.section][@"specValues"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
    
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *dic = self.data[section];
    return  [dic objectForKey:@"spec"];
}

-(void)JumPhidenBtn:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(ShoppingSelect:)]) {
        
        [self.delegate ShoppingSelect:sender];
    }
}

-(void)uodataTableViewCellHight:(TestCell *)cell andHight:(CGFloat)hight andIndexPath:(NSIndexPath *)indexPath{
    
    if (![self.dicH[indexPath] isEqualToNumber: @(hight)]) {
        self.dicH[indexPath] = @(hight);
//        NSLog(@"indexPath.row = %ld",(long)indexPath.row);
//        NSLog(@"高度 = %lf",[@(hight) floatValue]);
        [self.MainTableView reloadData];
    }
}

//选中的第几区  及内容
-(void)PostSelectShopTypeInfo:(TestCell *)cell andIndexPath:(NSIndexPath *)indexPath content:(NSString *)content
{
    
    if ([self.delegate respondsToSelector:@selector(shopModelSelectDetail:Indexpath:)]) {
        
        [self.delegate shopModelSelectDetail:content Indexpath:cell.tag];
    }
    
}

- (NSMutableDictionary *)dicH {
    if(_dicH == nil) {
        _dicH = [[NSMutableDictionary alloc] init];
    }
    return _dicH;
}

@end
