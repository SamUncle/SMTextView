//
//  SMTextView.h
//  SMTextView
//
//  Created by SmileSun on 16-5-23.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTextView : UITextView
@property (nonatomic, strong) UILabel * placeHolderLabel;

@property (nonatomic, copy) NSString * placeHolder;

@property (nonatomic, strong) UIColor * placeHolderColor;

@property (nonatomic,assign)BOOL isAutoHeight;

@end
