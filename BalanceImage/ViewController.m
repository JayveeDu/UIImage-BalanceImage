//
//  ViewController.m
//  BalanceImage
//
//  Created by jv on 2017/5/31.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+BalanceImage.h"

@interface ViewController ()
{
    UIImage *_originImage;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _originImage = [UIImage imageNamed:@"bubble"];
    
}


#pragma mark - action

- (IBAction)clickAction:(id)sender {
    
    _label.text = _textView.text;
    CGFloat labelWidth = [_label systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width;
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat widthToResize = labelWidth > maxWidth ? maxWidth : labelWidth;
    _imageView.image = [_originImage balanceImageToSize:(CGSize){widthToResize ,_originImage.size.height} factorWidth:0.9 factorHeight:0.5];
}



@end
