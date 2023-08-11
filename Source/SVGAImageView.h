//
//  SVGAImageView.h
//  SVGAPlayer
//
//  Created by 崔明辉 on 2017/10/17.
//  Copyright © 2017年 UED Center. All rights reserved.
//

#import "SVGAPlayer.h"

@interface SVGAImageView : SVGAPlayer

@property (nonatomic, assign) IBInspectable BOOL autoPlay; ///< 自动播放(默认YES)
//@property (nonatomic, strong) IBInspectable NSString *imageName;
@property (nonatomic, strong) IBInspectable NSData *imageData;
@property (nonatomic, copy) IBInspectable NSString *imageUrl; ///< 线上image地址

@end
