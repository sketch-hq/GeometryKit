//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphhics/CoreGraphics.h>
#endif

@class GKPoint;

@interface GKOffset : NSObject <NSCopying>

#pragma maro - Creating Offsets
+ (id)offsetWithValue:(CGFloat)value;
+ (id)offsetWithSize:(NSSize)size;
+ (id)offsetWithPoint:(NSPoint)point;
+ (id)offsetFromPoint:(GKPoint *)fromPoint toPoint:(GKPoint *)toPoint;
- (id)initWithSize:(NSSize)size;

#pragma mark - Properties
@property (assign, nonatomic) NSSize offset;
@property (assign, nonatomic) CGFloat xOffset, yOffset;
@property (assign, nonatomic) NSPoint point;

#pragma mark -
- (GKOffset *)invert;
- (BOOL)isSmallerThanOffset:(GKOffset *)offset;
@end
