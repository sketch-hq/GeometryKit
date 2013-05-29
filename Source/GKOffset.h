//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphhics/CoreGraphics.h>
#endif

@class GKPoint;

@interface GKOffset : NSObject <NSCopying>
{
  NSSize offset;
}

#pragma maro - Creating Offsets
+ (id)offsetWithValue:(CGFloat)value;
+ (id)offsetWithSize:(NSSize)size;
+ (id)offsetWithPoint:(NSPoint)point;
+ (id)offsetFromPoint:(GKPoint *)fromPoint toPoint:(GKPoint *)toPoint;
- (id)initWithSize:(NSSize)size;

#pragma mark - Properties
@property NSSize offset;
@property CGFloat xOffset, yOffset;
@property NSPoint point;

#pragma mark -
- (GKOffset *)invert;
- (BOOL)isSmallerThanOffset:(GKOffset *)offset;
@end
