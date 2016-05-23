//
//  ViewController.m
//  SMTextView2
//
//  Created by SmileSun on 16-5-23.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "ViewController.h"
#import "SMTextView.h"
#define kTextBorderColor     RGBCOLOR(227,224,216)

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface ViewController ()<UITextViewDelegate>
@property(strong, nonatomic)SMTextView * textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [[SMTextView alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 100)];
    //_textView.backgroundColor = [UIColor grayColor];
    //_textView.font = [UIFont systemFontOfSize:14.f];
    //_textView.textColor = [UIColor redColor];
    _textView.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_textView];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
