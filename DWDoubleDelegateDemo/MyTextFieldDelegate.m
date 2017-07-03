//
//  MyTextFieldDelegate.m
//  DWDoubleDelegateDemo
//
//  Created by Dawn Wang on 2017/7/3.
//  Copyright © 2017年 Dawn Wang. All rights reserved.
//

#import "MyTextFieldDelegate.h"
#import <objc/runtime.h>

@implementation MyTextFieldDelegate

- (void)setOriginDelegate:(id)originDelegate {
    _originDelegate = originDelegate;
    [self dw_allProtocolMethodImplementation];
}


- (void)dw_allProtocolMethodImplementation{
    //协议需要实现的方法
    unsigned int protocolCount = 0;
    //获取当前类所有的协议
    __unsafe_unretained Protocol **allP = class_copyProtocolList(self.class, &protocolCount);
    for (int i = 0; i < protocolCount; i++) {
        Protocol *protocol = allP[i];
        BOOL conform = class_conformsToProtocol(self.class, protocol);
        if (conform) {
            unsigned int protocolMethodCount = 0;
            
            //获取协议方法描述
            struct objc_method_description *protocolDes = protocol_copyMethodDescriptionList(protocol, NO, YES, &protocolMethodCount);
            
            for (int i = 0; i < protocolMethodCount; i++) {
                struct objc_method_description protocolObject = protocolDes[i];
                SEL selector = protocolObject.name;
                //当前类是否实现此方法
                BOOL isResponse = class_respondsToSelector(self.class, selector);
                //originalDelegate是否实现此方法
                BOOL isOriginalResponse = class_respondsToSelector([self.originDelegate class], selector);
                if ((!isResponse) && isOriginalResponse) {
                    //如果当前类没有实现但是originalDelegate实现了 则替换
                    Method originalMethod = class_getInstanceMethod([self.originDelegate class], selector);
                    class_replaceMethod(self.class, selector, class_getMethodImplementation([self.originDelegate class], selector), method_getTypeEncoding(originalMethod));
                    
                }
            }
        }
    }
    
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);

    if ([self.originDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.originDelegate textFieldDidBeginEditing:self.textField];
    }
}
@end
