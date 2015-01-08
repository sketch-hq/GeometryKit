//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

/**
 * GKRect is a protocol that defines how rect-like instances should behave.
 * GKRect implements the protocol, but so do a few other objects which act as rects
 */

@protocol GKRect <NSObject>
@property (nonatomic) NSRect rect;
@property (nonatomic) CGFloat x,y, width, height, maxX, maxY;
@property (nonatomic) NSPoint origin;
@property (nonatomic) NSSize size;
@end

@interface GKRect : NSObject <NSCopying, GKRect>

#pragma mark - Creating Rects
+ (instancetype)rectWithRect:(NSRect)aRect;
- (id)initWithRect:(NSRect)aRect;

+ (instancetype)rectWithUnionOfRects:(NSArray *)gkRects;
+ (instancetype)safeRectWithUnionOfRects:(NSArray *)gkRects;
+ (instancetype)rectWithUnionOfGKRects:(NSArray *)gkRects;
- (void)unionWith:(GKRect *)rect;
- (BOOL)intersectsWithRect:(GKRect *)otherRect;

- (void)normalise;
- (void)scaleBy:(CGFloat)scale;

#pragma mark - Basic Properties
@property (nonatomic) NSRect rect;
@property (nonatomic) CGFloat x,y, width, height, midX, midY  BC_SCRIPTING_API;
@property (nonatomic) NSPoint origin;
@property (nonatomic) NSSize size;
@end
