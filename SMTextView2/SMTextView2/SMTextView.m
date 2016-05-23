//
//  SMTextView.m
//  SMTextView2
//
//  Created by SmileSun on 16-5-23.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMTextView.h"
#define kTextBorderColor     RGBCOLOR(227,224,216)
#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define getLimitNum (self.limitNum > 0 ? self.limitNum : 300)

@implementation SMTextView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //[self setPlaceholder:@"请输入少于300字的内容"];
        self.placeholder = @"请输入少于300字的内容";
        //[self setPlaceholderColor:[UIColor lightGrayColor]];
        self.placeholderColor = RGBCOLOR(137, 137, 137);//占位符颜色
        self.layer.cornerRadius = 4.0f;//边框圆角
        self.layer.borderColor = kTextBorderColor.CGColor;//边框颜色
        self.layer.borderWidth = 0.5;//边框宽度
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    
    return self;
}

-(UILabel *)placeHolderLabel{
    if(_placeHolderLabel==nil){
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, 20,20)];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        label.font = self.font;
        label.textColor = self.placeholderColor;
        label.hidden = NO;
        [label sizeToFit];
        _placeHolderLabel = label;
        [self addSubview:_placeHolderLabel];
    }
    [self sendSubviewToBack:_placeHolderLabel];
    _placeHolderLabel.text = self.placeholder;
    return _placeHolderLabel;
}


-(UILabel *) countNumLabel{
    if(_countNumLabel==nil){
        _countNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.frame)-90, CGRectGetMaxY(self.frame)+6, 80, 21)];
        _countNumLabel.textAlignment = NSTextAlignmentRight;
        _countNumLabel.text = [NSString stringWithFormat:@"%ld",getLimitNum] ;
        _countNumLabel.backgroundColor = [UIColor whiteColor];
        [self.superview addSubview:_countNumLabel];
    }
    return _countNumLabel;
}

- (void)textChanged:(NSNotification *)notification{
    
    NSInteger wordCount = self.text.length;
    if(![self wordLimit:wordCount]) return;
    self.countNumLabel.text = [NSString stringWithFormat:@"%ld/%ld",(long)wordCount,getLimitNum];
    
    if ([[self text] length] == 0) {
        self.placeHolderLabel.hidden = NO;
    }
    else{
        self.placeHolderLabel.hidden = YES;
    }
    
}


-(BOOL)wordLimit:(NSInteger) length{
    if (length <= getLimitNum) {
        self.editable = YES;
        return YES;
    }
    else{
        self.editable = NO;
        return NO;
        
    }
    return YES;
}


-(void)layoutSubviews{
    [self countNumLabel];
    self.placeHolderLabel.frame = CGRectMake(8, 8, self.bounds.size.width, 20);
}


-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
