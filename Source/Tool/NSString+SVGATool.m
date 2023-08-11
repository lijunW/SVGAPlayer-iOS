//
//  NSString+SVGATool.m
//  SVGAPlayer
//
//  Created by ChenJie on 2023/8/11.
//  Copyright © 2023 UED Center. All rights reserved.
//

#import "NSString+SVGATool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SVGATool)

+ (NSString *)md5WithData:(NSData *)data {
    if (data == nil) {
        return @"";
    }
    
    //1: 创建一个MD5对象
    CC_MD5_CTX md5;
    //2: 初始化MD5
    CC_MD5_Init(&md5);
    //3: 准备MD5加密
    CC_MD5_Update(&md5, data.bytes, (uint32_t)data.length);
    //4: 准备一个字符串数组, 存储MD5加密之后的数据
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //5: 结束MD5加密
    CC_MD5_Final(result, &md5);
    NSMutableString *resultString = [NSMutableString string];
    //6:从result数组中获取最终结果
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [resultString appendFormat:@"%02x", result[i]];
    }
    return resultString.copy;
}

@end
