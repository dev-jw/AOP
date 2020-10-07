//
//  Person.m
//  NSProxyTest
//
//  Created by Zsy on 2020/10/7.
//

#import "Person.h"

@implementation Person

- (void)play:(NSString *)subject andGame:(NSString *)name {
    NSLog(@"Invorking method on %@ object with selector %@",[self class], NSStringFromSelector(_cmd));
}

- (void)play:(NSString *)subject :(NSString *)name {
    NSLog(@"Invorking method on %@ object with selector %@",[self class], NSStringFromSelector(_cmd));
}

@end
