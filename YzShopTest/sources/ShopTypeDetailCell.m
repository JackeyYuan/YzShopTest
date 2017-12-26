//
//  ShopTypeDetailCell.m
//  I-Young
//
//  Created by a1 on 2017/12/6.
//  Copyright © 2017年 Jack. All rights reserved.
//
//#import "MSSAutoresizeLabelFlowConfig.h"
#import "ShopTypeDetailCell.h"
#import "Masonry.h"
#define itemHeight 60

@implementation ShopTypeDetailCell

+(instancetype)recommendCellWithCollectionView:(UICollectionView*)CollectionView indePath:(NSIndexPath *)indePath{
    id cell = [CollectionView dequeueReusableCellWithReuseIdentifier:@"ShopTypeDetailCell" forIndexPath:indePath];
    if (!cell){
        [CollectionView registerClass:[self class] forCellWithReuseIdentifier:@"ShopTypeDetailCell"];
    }
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _selectBtn = [UILabel new];
        [self.contentView addSubview:self.selectBtn];
        self.selectBtn.translatesAutoresizingMaskIntoConstraints = NO;
        _selectBtn.font = [UIFont systemFontOfSize:13];
        _selectBtn.layer.cornerRadius = 15;
        _selectBtn.layer.masksToBounds = YES;
        _selectBtn.textAlignment = NSTextAlignmentCenter;
        _selectBtn.layer.borderColor = RGBACOLOR(220, 220, 220, 1.0).CGColor;
        _selectBtn.layer.borderWidth = 0.5;
      
        [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            // make 代表约束:
            make.top.equalTo(self.contentView).with.offset(0);   // 对当前view的top进行约束,距离参照view的上边界是 :
            make.left.equalTo(self.contentView).with.offset(0);  // 对当前view的left进行约束,距离参照view的左边界是 :
            make.height.equalTo(@30);                // 高度
            make.right.equalTo(self.contentView).with.offset(0); // 对当前view的right进行约束,距离参照view的右边界是 :
        }];
    }
    return self;
}

-(void)configCellWithTitle:(NSString *)title{
    self.selectBtn.text = title;
}

-(void)upDataSubViewTextColor:(UIColor *)color BGColor:(UIColor *)BGcolor
{
    self.selectBtn.textColor = color;
    self.selectBtn.backgroundColor = BGcolor;
}
#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{

    [self setNeedsLayout];

    [self layoutIfNeeded];
//
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];

    NSString *str = [NSString stringWithFormat:@"     %@     ",self.selectBtn.text];
//     self.selectBtn.frame.size.height
    CGRect frame = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX,30) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.selectBtn.font,NSFontAttributeName, nil] context:nil];

    frame.size.height = 30;
    attributes.frame = frame;
    // 如果你cell上的子控件不是用约束来创建的,那么这边必须也要去修改cell上控件的frame才行
     self.contentView.frame = CGRectMake(0, 0, attributes.frame.size.width, 30);

    return attributes;
}

//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
//
//    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
//
//    NSString *str = [NSString stringWithFormat:@"     %@     ",self.selectBtn.text];
//    ////     self.selectBtn.frame.size.height
//    CGRect rect = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingTruncatesLastVisibleLine|   NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil];
////    rect.size.width +=8;
//    rect.size.height+=10;
//    attributes.frame = rect;
//    return attributes;
//
//}
@end
