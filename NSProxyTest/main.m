//
//  main.m
//  NSProxyTest
//
//  Created by Zsy on 2020/10/7.
//

#import <UIKit/UIKit.h>

#import "AuditingInvoker.h"
#import "AspectProxy.h"
#import "Person.h"

#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        id person = [[Person alloc] init];
        
        // 设置代理中注册的选择器数组
        NSValue *selValue = [NSValue valueWithPointer:@selector(play:andGame:)];
        NSArray *selValues = @[selValue];
        
        // 创建AuditingInvoker
        AuditingInvoker *invoker = [[AuditingInvoker alloc] init];
        
        // 创建 Person 对象的代理 personProxy
        id personProxy = [[AspectProxy alloc] initWithObject:person selectors:selValues andInvoker:invoker];
        
        // 使用指定的选择器向该代理发送消息---例子1
        [personProxy play:@"Computer" andGame:@"LOL"];
        
        // 使用还未注册到代理中的其他选择器，向这个代理发送消息！---例子2
        [personProxy play:@"Switch" :@"Pokemon"];
        
        // 为这个代理注册一个选择器并再次向其发送消息---例子3
        [personProxy registerSelector:@selector(play::)];
        [personProxy play:@"Switch" :@"Pokemon"];

        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
