//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKOffset.h"
#import "GKPoint.h"

@implementation GKOffset
@synthesize offset;
@dynamic xOffset, yOffset, point;

+ (id)offsetWithValue:(CGFloat)value
{
  return [self offsetWithSize:NSMakeSize(value, value)];
}

+ (id)offsetWithSize:(NSSize)size
{
  return [[self alloc] initWithSize:size];
}

+ (id)offsetWithPoint:(NSPoint)point
{
  return [self offsetWithSize:NSMakeSize(point.x, point.y)];
}

+ (id)offsetFromPoint:(GKPoint *)fromPoint toPoint:(GKPoint *)toPoint
{
  return [GKOffset offsetWithSize:NSMakeSize(fromPoint.x-toPoint.x, fromPoint.y-toPoint.y)];
}

- (id)initWithSize:(NSSize)size
{
  self = [super init];
  if (self)
    offset = size;
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return [[[self class] alloc] initWithSize:offset];
}

- (GKOffset *)invert
{
  return [[[self class] alloc] initWithSize:NSMakeSize(-offset.width, -offset.height)];
}

- (CGFloat)xOffset { return offset.width;  }
- (CGFloat)yOffset { return offset.height; }
- (void)setXOffset:(CGFloat)xOffset { offset.width  = xOffset; }
- (void)setYOffset:(CGFloat)yOffset { offset.height = yOffset; }
- (NSPoint)point { return NSMakePoint(offset.width, offset.height); };

- (BOOL)isSmallerThanOffset:(GKOffset *)otherOffset
{
  return ABS(self.xOffset) < ABS(otherOffset.xOffset) && ABS(self.yOffset) < ABS(otherOffset.yOffset);
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ (%i,%i)", [super description], (int)offset.width, (int)offset.height];
}

@end
