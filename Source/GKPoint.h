//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

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
