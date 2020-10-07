//
//  Person.h
//  NSProxyTest
//
//  Created by Zsy on 2020/10/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)play:(NSString *)subject andGame:(NSString *)name;

- (void)play:(NSString *)subject :(NSString *)name;
@end

NS_ASSUME_NONNULL_END
