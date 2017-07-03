//
//  MyTextFieldDelegate.h
//  DWDoubleDelegateDemo
//
//  Created by Dawn Wang on 2017/7/3.
//  Copyright © 2017年 Dawn Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MyTextFieldProtocol.h"
@interface MyTextFieldDelegate : NSObject<UITextFieldDelegate,MyTextFieldProtocol>

@property (nonatomic, weak) id originDelegate;

@property (nonatomic, weak) UITextField *textField;

@end
