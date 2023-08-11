//
//  NSString+SVGATool.h
//  SVGAPlayer
//
//  Created by ChenJie on 2023/8/11.
//  Copyright © 2023 UED Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SVGATool)

+ (NSString *)md5WithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
