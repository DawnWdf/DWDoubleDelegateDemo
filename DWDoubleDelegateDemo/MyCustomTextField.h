//
//  MyCustomTextField.h
//  DWDoubleDelegateDemo
//
//  Created by Dawn Wang on 2017/7/3.
//  Copyright © 2017年 Dawn Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextFieldProtocol.h"

@interface MyCustomTextField : UITextField
@property (nonatomic, weak) id<MyTextFieldProtocol> myDelegate;

@end
