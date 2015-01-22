//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

/**
 * BCRect is a protocol that defines how rect-like instances should behave.
 * BCRect implements the protocol, but so do a few other objects which act as rects
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

#pragma mark - Basic Properties
@property (nonatomic) NSRect rect;
@property (nonatomic) CGFloat x,y, width, height, midX, midY, minX, minY, maxX, maxY  BC_SCRIPTING_API;
@property (nonatomic) NSPoint origin, mid;
@property (nonatomic) NSSize size;
@end
