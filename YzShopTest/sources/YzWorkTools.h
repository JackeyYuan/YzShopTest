//
//  YzWorkTools.h
//  I-Young
//
//  Created by a1 on 2017/10/26.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YzWorkTools : NSObject

#define IphonePlus  [UIScreen mainScreen].bounds.size.width == 414

#define IphoneX  [UIScreen mainScreen].bounds.size.height == 812

#define YZGUserDefault [NSUserDefaults standardUserDefaults]

#define YzWidth [UIScreen mainScreen].bounds.size.width

#define YzHeight [UIScreen mainScreen].bounds.size.height
// color
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define RGBColorAlpha(r,g,b,p) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(p)/1.0]

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//#endif
@end

