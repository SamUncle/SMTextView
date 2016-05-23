//
//  SMTextView.h
//  SMTextView2
//
//  Created by SmileSun on 16-5-23.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTextView : UITextView
@property (nonatomic, strong) UILabel * placeHolderLabel;

@property (nonatomic, copy) NSString * placeholder;

@property (nonatomic, strong) UIColor * placeholderColor;

@property (nonatomic,strong) UILabel * countNumLabel;

@property (nonatomic,assign) long limitNum;//限制输入字数

@end
