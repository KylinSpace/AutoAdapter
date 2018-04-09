//
//  NSNumber+GC.h
//  AutoAdapter
//
//  Created by Kylin on 2018/4/9.
//  Copyright © 2018年 matchman. All rights reserved.
//

#import <UIKit/UIKit.h>

// 布局 height top  bottom 时用
#define GCW(Num) [NSNumber GC_ScreenWidthAdaptationWithNumber:(Num)]

// 布局 width left right leading trailing时用
#define GCH(Num) [NSNumber GC_screenHeightAdaptaionWithNumber:(Num)]

@interface NSNumber (GC)
+ (CGFloat)GC_screenHeightAdaptaionWithNumber:(CGFloat)num;
+ (CGFloat)GC_ScreenWidthAdaptationWithNumber:(CGFloat)num;
@end
