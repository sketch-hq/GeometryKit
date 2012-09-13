//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@implementation GKRect
@synthesize rect;

+ (id)rectWithRect:(NSRect)aRect
{
  return [[[self alloc] initWithRect:aRect] autorelease];
}

- (id)initWithRect:(NSRect)aRect
{
  self = [super init];
  if (self)
    rect = aRect;
  return self;
}

@dynamic x, y, width, height;

- (CGFloat)x { return rect.origin.x; }
- (CGFloat)y { return rect.origin.y; }
- (CGFloat)width  { return rect.size.width; }
- (CGFloat)height { return rect.size.height; }

- (void)setX:(CGFloat)x { rect.origin.x = x; }
- (void)setY:(CGFloat)y { rect.origin.y = y; }
- (void)setWidth:(CGFloat)width   { rect.size.width = width; }
- (void)setHeight:(CGFloat)height { rect.size.height = height; }

- (id)copyWithZone:(NSZone *)zone
{
  return [[[self class] alloc] initWithRect:self.rect];
}

- (BOOL)isEqual:(GKRect *)object
{
  if ([self class] == [object class])
    return NSEqualRects(self.rect, object.rect);
  else
    return NO;
}

- (NSString *)description
{
  return NSStringFromRect(self.rect);
}

- (void)normalise {
  self.x = NSMinX(rect);
  self.y = NSMinY(rect);
  self.width = ABS(self.width);
  self.height = ABS(self.height);
}

@end
