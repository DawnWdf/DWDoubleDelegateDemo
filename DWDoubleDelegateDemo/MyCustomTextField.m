//
//  MyCustomTextField.m
//  DWDoubleDelegateDemo
//
//  Created by Dawn Wang on 2017/7/3.
//  Copyright © 2017年 Dawn Wang. All rights reserved.
//

#import "MyCustomTextField.h"
#import "MyTextFieldDelegate.h"

@interface MyCustomTextField()

@property (nonatomic, strong) MyTextFieldDelegate *currentDelegate;

@end

@implementation MyCustomTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        MyTextFieldDelegate *del = [[MyTextFieldDelegate alloc] init];;
        del.textField = self;
        self.currentDelegate = del;
        self.delegate = (id)self.currentDelegate;
    }
    return self;
}

- (void)setDelegate:(id)delegate{
    if ([delegate isMemberOfClass:[MyTextFieldDelegate class]]) {
        [super setDelegate:delegate];
        return;
    }
    
    self.currentDelegate.originDelegate = delegate;
}

@end
