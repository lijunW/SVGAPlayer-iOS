//
//  SVGAImageView.m
//  SVGAPlayer
//
//  Created by 崔明辉 on 2017/10/17.
//  Copyright © 2017年 UED Center. All rights reserved.
//

#import "SVGAImageView.h"
#import "SVGAParser.h"
//cj
#import "NSString+SVGATool.h"

static SVGAParser *sharedParser;

@implementation SVGAImageView

+ (void)load {
    sharedParser = [SVGAParser new];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _autoPlay = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _autoPlay = YES;
    }
    return self;
}

//- (void)setImageName:(NSString *)imageName {
//    _imageName = imageName;
//    if ([imageName hasPrefix:@"http://"] || [imageName hasPrefix:@"https://"]) {
//        [sharedParser parseWithURL:[NSURL URLWithString:imageName] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//            [self setVideoItem:videoItem];
//            if (self.autoPlay) {
//                [self startAnimation];
//            }
//        } failureBlock:nil];
//    }
//    else {
//        [sharedParser parseWithNamed:imageName inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
//            [self setVideoItem:videoItem];
//            if (self.autoPlay) {
//                [self startAnimation];
//            }
//        } failureBlock:nil];
//    }
//}

//加载imageData带回调, 需要在回调中自行处理播放逻辑
- (void)loadImageData:(NSData *)imageData
             complete:(void(^_Nullable)(SVGAVideoEntity * _Nonnull videoItem))completeBlock {
    
    _imageData = imageData;
    
    [sharedParser parseWithData:imageData cacheKey:[NSString md5WithData:imageData] completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (completeBlock) {
            completeBlock(videoItem);
        } else {
            [self setVideoItem:videoItem];
            if (self.autoPlay) {
                [self startAnimation];
            }
        }
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
    
}
//加载imageData带回调, 需要在回调中自行处理播放逻辑
- (void)loadImageUrl:(NSString *)imageUrl
            complete:(void(^_Nullable)(SVGAVideoEntity * _Nonnull videoItem))completeBlock {
    _imageUrl = imageUrl;
    
    [sharedParser parseWithURL:[NSURL URLWithString:imageUrl] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
        if (completeBlock) {
            completeBlock(videoItem);
        } else {
            [self setVideoItem:videoItem];
            if (self.autoPlay) {
                [self startAnimation];
            }
        }
    } failureBlock:nil];
}

//暴露SVGAParser
+ (nonnull SVGAParser *)shareParser {
    return sharedParser;
}

#pragma mark -  set/get
- (void)setImageData:(NSData *)imageData{
    [self loadImageData:imageData complete:nil];
}

- (void)setImageUrl:(NSString *)imageUrl {
    [self loadImageUrl:imageUrl complete:nil];
}

@end
