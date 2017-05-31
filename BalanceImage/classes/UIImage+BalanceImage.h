//
//  UIImage+BalanceImage.h
//  BalanceImage
//
//  Created by jv on 2017/5/31.
//  Copyright © 2017年 jv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BalanceImage)


/**
 expand image to given size , and make it symmetry

 @param toSize size to expand
 @param factorWidth horizontal point to expand
 @param factorHeight vertical point to expand
 @return stretchable image
 */
- (UIImage *)balanceImageToSize:(CGSize)toSize factorWidth:(CGFloat)factorWidth factorHeight:(CGFloat)factorHeight;

@end
