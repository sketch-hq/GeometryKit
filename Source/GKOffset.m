//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKOffset.h"
#import "GKPoint.h"

@implementation GKOffset

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
    _offset = size;
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return [[[self class] alloc] initWithSize:_offset];
}

- (GKOffset *)invert
{
  return [[[self class] alloc] initWithSize:NSMakeSize(-_offset.width, -_offset.height)];
}

- (CGFloat)xOffset { return _offset.width;  }
- (CGFloat)yOffset { return _offset.height; }
- (void)setXOffset:(CGFloat)xOffset { _offset.width  = xOffset; }
- (void)setYOffset:(CGFloat)yOffset { _offset.height = yOffset; }
- (NSPoint)point { return NSMakePoint(_offset.width, _offset.height); };

- (BOOL)isSmallerThanOffset:(GKOffset *)otherOffset
{
  return ABS(self.xOffset) < ABS(otherOffset.xOffset) && ABS(self.yOffset) < ABS(otherOffset.yOffset);
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ (%i,%i)", [super description], (int)_offset.width, (int)_offset.height];
}

@end
