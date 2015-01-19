//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

static inline CGFloat GKRectValueForKey(CGRect rect, NSString *key) {
  if ([key isEqualToString:@"minX"])
    return CGRectGetMinX(rect);
  else if ([key isEqualToString:@"midX"])
    return CGRectGetMidX(rect);
  else if ([key isEqualToString:@"maxX"])
    return CGRectGetMaxX(rect);
  
  else if ([key isEqualToString:@"minY"])
    return CGRectGetMinY(rect);
  else if ([key isEqualToString:@"midY"])
    return CGRectGetMidY(rect);
  else if ([key isEqualToString:@"maxY"])
    return CGRectGetMaxY(rect);
  else
    return 0;
}

static inline CGRect GKRectNormalise(CGRect rect) {
  return CGRectMake(CGRectGetMinX(rect),
                    CGRectGetMinY(rect),
                    ABS(rect.size.width),
                    ABS(rect.size.height));
}

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

- (void)scaleBy:(CGFloat)scale;

#pragma mark - Basic Properties
@property (nonatomic) NSRect rect;
@property (nonatomic) CGFloat x,y, width, height, midX, midY  BC_SCRIPTING_API;
@property (nonatomic) NSPoint origin;
@property (nonatomic) NSSize size;
@end
