//
//  ViewController.m
//  DWDoubleDelegateDemo
//
//  Created by Dawn Wang on 2017/7/3.
//  Copyright © 2017年 Dawn Wang. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomTextField.h"

@interface ViewController ()<UITextFieldDelegate,MyTextFieldProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyCustomTextField *textField = [[MyCustomTextField alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    textField.delegate = self;
    textField.myDelegate = self;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:textField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}
@end
