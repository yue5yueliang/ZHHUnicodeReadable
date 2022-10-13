//
//  ZHHUnicodeReadable.m
//
//  ZHHAnneKitDemo-Example
//
//  Created by 桃色三岁 on 2020/12/28.
//  Copyright © 2020 桃色三岁. All rights reserved.
//

#import "ZHHUnicodeReadable.h"
#import <objc/runtime.h>

static inline void zhh_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSString (ZHHUnicodeReadable)

- (NSString *)stringByReplaceUnicode {
    NSMutableString *convertedString = [self mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end

@implementation NSArray (ZHHUnicodeReadable)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        zhh_swizzleSelector(class, @selector(description), @selector(zhh_description));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(zhh_descriptionWithLocale:));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(zhh_descriptionWithLocale:indent:));
    });
}

/**
 *  我觉得 
 *  可以把以下的方法放到一个NSObject的category中
 *  然后在需要的类中进行swizzle
 *  但是又觉得这样太粗暴了。。。。
 */

- (NSString *)zhh_description {
    return [[self zhh_description] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale {
    return [[self zhh_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self zhh_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSDictionary (ZHHUnicodeReadable)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        zhh_swizzleSelector(class, @selector(description), @selector(zhh_description));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(zhh_descriptionWithLocale:));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(zhh_descriptionWithLocale:indent:));
    });
}

- (NSString *)zhh_description {
    return [[self zhh_description] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale {
    return [[self zhh_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self zhh_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSSet (ZHHUnicodeReadable)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        zhh_swizzleSelector(class, @selector(description), @selector(zhh_description));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(zhh_descriptionWithLocale:));
        zhh_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(zhh_descriptionWithLocale:indent:));
    });
}

- (NSString *)zhh_description {
    return [[self zhh_description] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale {
    return [[self zhh_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)zhh_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self zhh_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

