//
//  NSString+MD5.m
//  ExtremeMother
//
//  Created by CC on 15/4/20.
//  Copyright (c) 2015年 John TSai. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

// 32 MD5 enconde
- (NSString *)MD5 {
    const char *str = [self UTF8String];
    unsigned char md5_buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), md5_buffer);
    
    NSMutableString *string = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i ++) {
        [string appendFormat:@"%02x",md5_buffer[i]];
    }
    return string;
}

@end
