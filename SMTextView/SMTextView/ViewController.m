//
//  ViewController.m
//  SMTextView
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
@property(nonatomic,strong)SMTextView * textView;
@property(nonatomic,strong)UILabel * numLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTextView];
    
//    _textView = [[SMTextView alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 100)];
//    _textView.backgroundColor = [UIColor whiteColor];
//    _textView.delegate = self;
//    _textView.font = [UIFont systemFontOfSize:14.f];
//    _textView.textColor = [UIColor blackColor];
//    _textView.textAlignment = NSTextAlignmentLeft;
//    _textView.placeHolder = @"请输入大于10少于300百字的评价";
//    [self.view addSubview:_textView];
//    
//    
//    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_textView.frame)-90, CGRectGetMaxY(_textView.frame)+6, 80, 21)];
//    _numLabel.textAlignment = NSTextAlignmentRight;
//    _numLabel.text = @"300";
//    _numLabel.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_numLabel];
}
- (void)createTextView{
    // 创建textView
    SMTextView *textView = [[SMTextView alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 100)];
    // 设置颜色
    textView.backgroundColor = [UIColor whiteColor];
    // 设置提示文字
    textView.placeHolder = @"请输入文本";
    // 设置提示文字颜色(默认红色（自定义的默认颜色可在SMTextView中更改）)
    textView.placeHolderColor = [UIColor greenColor];
    // 设置textView的字体(默认14（自定义的默认字体大小可在SMTextView中更改）)
    textView.font = [UIFont systemFontOfSize:17];
    // 设置内容是否有弹簧效果
    textView.alwaysBounceVertical = YES;
    // 设置textView的高度根据文字自动适应变宽
    textView.isAutoHeight = YES;
    // 添加到视图上
    [self.view addSubview:textView];
    
    self.textView = textView;
    
}
#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.numLabel.text = [NSString stringWithFormat:@"%ld/300",(long)wordCount];
    if (wordCount > 300) {
        self.numLabel.textColor = [UIColor redColor];
    }
    [self wordLimit:textView];
}

#pragma mark 超过300字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length <= 300) {
        NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
    }
    else{
        self.textView.editable = NO;
        
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
