//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#endif

@interface GKRect : NSObject <NSCopying>
{
  NSRect rect;
}

#pragma mark - Creating Rects
+ (id)rectWithRect:(NSRect)aRect;
- (id)initWithRect:(NSRect)aRect;

- (void)normalise;

#pragma mark - Basic Properties
@property NSRect rect;
@property CGFloat x,y, width, height;
@end
