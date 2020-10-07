//
//  AuditingInvoker.m
//  NSProxyTest
//
//  Created by Zsy on 2020/10/7.
//

#import "AuditingInvoker.h"

@implementation AuditingInvoker

- (void)preInvoke:(NSInvocation *)inv withTarget:(id)target{
    NSLog(@"before sending message with selector %@ to %@ object", NSStringFromSelector([inv selector]), [target class]);
}
- (void)postInvoke:(NSInvocation *)inv withTarget:(id)target{
    NSLog(@"after sending message with selector %@ to %@ object", NSStringFromSelector([inv selector]), [target class]);
    
}

@end
