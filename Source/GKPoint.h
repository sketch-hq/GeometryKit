//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

static inline BOOL GKPointCanSnapToPoint(NSPoint point, NSPoint other, CGFloat margin) {
  return ABS(point.x - other.x) < margin || ABS(point.y - other.y) < margin;
}

static inline NSPoint GKPointSnapToPoint(NSPoint point, NSPoint other, CGFloat margin) {
  if (ABS(point.x - other.x) < margin)
    point.x = other.x;
  if (ABS(point.y - other.y) < margin)
    point.y = other.y;
  return point;
}

@class GKOffset, GKRect, GKAxis;

@interface GKPoint : NSObject <NSCopying>

#pragma mark - Creating Points
+ (id)pointWithPoint:(NSPoint)aPoint;
+ (id)pointWithX:(CGFloat)x y:(CGFloat)y;
- (id)initWithPoint:(NSPoint)aPoint;

#pragma mark - Basic Properties
@property (assign, nonatomic) NSPoint point;
@property (assign, nonatomic) CGFloat x, y;

#pragma mark -
- (CGFloat)distanceToPoint:(GKPoint *)point;
- (GKOffset *)offsetToPoint:(GKPoint *)point;

#pragma mark - Snapping
- (GKPoint *)snapToRect:(GKRect *)rect withMargin:(CGFloat)margin;
- (GKPoint *)snapToPoint:(GKPoint *)point withMargin:(CGFloat)margin;
- (GKPoint *)snapToLines:(NSArray *)lines withMargin:(CGFloat)margin;

#pragma mark - Axis
- (CGFloat)positionForAxis:(GKAxis *)axis;
- (void)setPosition:(CGFloat)position forAxis:(GKAxis *)axis;
@end
