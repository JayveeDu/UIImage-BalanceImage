//
//  UIImage+BalanceImage.m
//  BalanceImage
//
//  Created by jv on 2017/5/31.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "UIImage+BalanceImage.h"

@implementation UIImage (BalanceImage)

- (UIImage *)balanceImageToSize:(CGSize)toSize factorWidth:(CGFloat)factorWidth factorHeight:(CGFloat)factorHeight
{
    //get how much length image need to expand
    CGFloat expandWidth = toSize.width - self.size.width;
    
    if (expandWidth <= 0) return self;
    
    CGFloat scaleW = factorWidth;
    CGFloat scaleH = factorHeight;
    
    //point to repeat horizontal image
    NSInteger horCutSize = self.size.width * scaleW;
    //point to repeat vertical image
    NSInteger verCutSize = self.size.height * scaleH;
    
    //create new image , make its right part satisfied with the half (to)Size passed in
    UIImage *tempeImage = [self stretchableImageWithLeftCapWidth:horCutSize topCapHeight:verCutSize];
    NSInteger half = expandWidth / 2;
    CGFloat rightWidthToExpand = self.size.width + half;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rightWidthToExpand, toSize.height), NO, 0);
    [tempeImage drawInRect:CGRectMake(0, 0, rightWidthToExpand, toSize.height)];
    UIImage *tempEndImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //leave left part alone ,and make the right expanded image strechable
    NSInteger leftTempEndImageSize = self.size.width - horCutSize;
    UIImage *strechableImage = [tempEndImage stretchableImageWithLeftCapWidth:leftTempEndImageSize topCapHeight:verCutSize];
    
    return strechableImage;
}

@end
