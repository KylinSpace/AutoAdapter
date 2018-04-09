//
//  NSNumber+GC.m
//  AutoAdapter
//
//  Created by Kylin on 2018/4/9.
//  Copyright © 2018年 matchman. All rights reserved.
//

#import "NSNumber+GC.h"

static CGFloat const iPhone5W = 320.0;
static CGFloat const iPhone6W = 375.0;
static CGFloat const iPhone6PW = 414.0;
//static CGFloat const iPhoneXW = 375.0;

static CGFloat const iPhone5H = 568.0;
static CGFloat const iPhone6H = 667.0;
static CGFloat const iPhone4H = 480.0;
static CGFloat const iPhone6PH = 736.0;
static CGFloat const iPhoneXH = 812.0;

#define iPhone4  ([UIScreen mainScreen].bounds.size.height==480 ? YES : NO)
#define iPhone5  ([UIScreen mainScreen].bounds.size.height==568 ? YES : NO)
#define iPhone6  ([UIScreen mainScreen].bounds.size.height==667 ? YES : NO)
#define iPhone6P ([UIScreen mainScreen].bounds.size.height==736 ? YES : NO)
#define iPhoneX  ([UIScreen mainScreen].bounds.size.height==812 ? YES : NO)

// 默认以iPhone6 为参照比例  据体根据UI 设计图来修改
static CGFloat const referenceW = iPhone6W;
static CGFloat const referenceH = iPhone6H;
@implementation NSNumber (GC)

// 以高度进行适配
+ (CGFloat)GC_screenHeightAdaptaionWithNumber:(CGFloat)num{
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
    CGFloat AdaNum = [orgNum doubleValue];
    
    if (iPhone4) {
        AdaNum = iPhone4H / referenceH * AdaNum;
    }else if (iPhone5){
        AdaNum = iPhone5H / referenceH * AdaNum;
    }else if (iPhone6){
        AdaNum = iPhone6H / referenceH * AdaNum;
    }else if (iPhone6P){
        AdaNum = iPhone6PH / referenceH * AdaNum;
    }else if (iPhoneX){
        AdaNum = iPhoneXH / referenceH * AdaNum;
    }
    
    return AdaNum;
}

// 以宽度进行适配
+ (CGFloat)GC_ScreenWidthAdaptationWithNumber:(CGFloat)num{
    
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
    CGFloat AdaNum = [orgNum doubleValue];
    
    if (iPhone5 || iPhone4) {
        AdaNum = iPhone5W / referenceW * AdaNum;
    }else if (iPhone6 || iPhoneX){
        AdaNum = iPhone6W / referenceW * AdaNum;
    }else if (iPhone6P){
        AdaNum = iPhone6PW / referenceW * AdaNum;
    }
    return AdaNum;
}
@end
