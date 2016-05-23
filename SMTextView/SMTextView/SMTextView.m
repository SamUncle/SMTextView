//
//  SMTextView.m
//  SMTextView
//
//  Created by SmileSun on 16-5-23.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMTextView.h"
#define kTextBorderColor     RGBCOLOR(227,224,216)
#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@implementation SMTextView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 4.0f;//边框圆角
        self.layer.borderColor = kTextBorderColor.CGColor;//边框颜色
        self.layer.borderWidth = 0.5;//边框宽度
        UILabel *placehoderLabel = [[UILabel alloc]init];
        placehoderLabel.numberOfLines = 0;
        [self addSubview:placehoderLabel];
        self.placeHolderLabel = placehoderLabel;
        self.placeHolderColor = [UIColor redColor];
        self.font = [UIFont systemFontOfSize:14];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

- (void)textDidChange{
    
    self.placeHolderLabel.hidden = self.text.length != 0;
    
}

- (void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeHolderLabel.font = font;
    [self setNeedsLayout];
}

- (void)setPlaceHolderColor:(UIColor *)placeholderColor{
    _placeHolderColor = placeholderColor;
    self.placeHolderLabel.textColor = placeholderColor;
}

- (void)setIsAutoHeight:(BOOL)isAutoHeight{
    _isAutoHeight = isAutoHeight;
    [self setNeedsLayout];
}

- (void)setPlaceHolder:(NSString *)placehoder{
    
    _placeHolder = [placehoder copy];
    self.placeHolderLabel.text = placehoder;
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGSize maxSize = CGSizeMake(self.placeHolderLabel.frame.size.width-10, MAXFLOAT);
    CGRect LabelFrame = [self.placeHolder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.placeHolderLabel.font,NSFontAttributeName, nil] context:nil];
    self.placeHolderLabel.frame = CGRectMake(5, 8, self.frame.size.width - 10, LabelFrame.size.height);
    
    CGRect textFrame = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil];
    
    
    if (textFrame.size.height > self.frame.size.height && self.isAutoHeight) {
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textFrame.size.height);
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}
@end
