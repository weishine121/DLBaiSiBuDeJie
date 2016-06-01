//
//  DLLoginRegisterTextField.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/11.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLLoginRegisterTextField.h"

static NSString * const DLPlaceholderColorKey = @"placeholderLabel.textColor";

@interface DLLoginRegisterTextField() <UITextFieldDelegate>

@end

@implementation DLLoginRegisterTextField

- (void)awakeFromNib{
    
    self.tintColor = [UIColor whiteColor];
    
    // 设置默认的占位文字颜色
//    [self setValue:[UIColor grayColor] forKeyPath:DLPlaceholderColorKey];
    self.placeholderColor = [UIColor grayColor];
    
}

- (BOOL)becomeFirstResponder{
//    [self setValue:[UIColor whiteColor] forKeyPath:DLPlaceholderColorKey];
    self.placeholderColor = [UIColor whiteColor];
   return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
//    [self setValue:[UIColor grayColor] forKeyPath:DLPlaceholderColorKey];
    self.placeholderColor = [UIColor grayColor];
    return [super resignFirstResponder];
}







@end

#pragma mark -
#pragma mark -  通知
//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];
//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing) name:UITextFieldTextDidEndEditingNotification object:self];


//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//
//- (void)beginEditing{
//    [self setValue:[UIColor whiteColor] forKeyPath:DLPlaceholderColorKey];
//}
//
//
//- (void)endEditing{
//    [self setValue:[UIColor grayColor] forKeyPath:DLPlaceholderColorKey];
//}



//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//
//    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];


//    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//
//}
//
//
///**
// *  开始编辑
// */
//- (void)editingDidBegin{
//    [self setValue:[UIColor whiteColor] forKeyPath:DLPlaceholderColorKey];
//}
//
///**
// *  结束编辑
// */
//- (void)editingDidEnd{
//    [self setValue:[UIColor grayColor] forKeyPath:DLPlaceholderColorKey];

//    self.delegate = self;
//




#pragma mark -
#pragma mark -  代理方法

//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    [self setValue:[UIColor whiteColor] forKeyPath:DLPlaceholderColorKey];
//}
//
//
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    [self setValue:[UIColor grayColor] forKeyPath:DLPlaceholderColorKey];
//}
