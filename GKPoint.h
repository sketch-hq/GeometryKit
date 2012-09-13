//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

@class GKOffset, GKRect, GKAxis;

@interface GKPoint : NSObject <NSCopying>
{
  NSPoint point;
}

#pragma mark - Creating Points
+ (id)pointWithPoint:(NSPoint)aPoint;
+ (id)pointWithX:(CGFloat)x y:(CGFloat)y;
- (id)initWithPoint:(NSPoint)aPoint;

#pragma mark - Basic Properties
@property NSPoint point;
@property CGFloat x, y;

#pragma mark -
- (CGFloat)distanceToPoint:(GKPoint *)point;
- (GKOffset *)offsetToPoint:(GKPoint *)point;
- (GKPoint *)snapToRect:(GKRect *)rect withMargin:(CGFloat)margin;
- (GKPoint *)snapToPoint:(GKPoint *)point withMargin:(CGFloat)margin;
- (CGFloat)positionForAxis:(GKAxis *)axis;
@end
