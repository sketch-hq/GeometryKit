//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@implementation GKRect
@dynamic midX, midY;

+ (id)rectWithRect:(NSRect)aRect
{
  return [[[self alloc] initWithRect:aRect] autorelease];
}

- (id)initWithRect:(NSRect)aRect
{
  self = [super init];
  if (self)
    _rect = aRect;
  return self;
}

+ (id)rectWithUnionOfRects:(NSArray *)gkRects {
  NSRect result = [[gkRects firstObject] rect];

  for (GKRect *rect in gkRects)
    result = NSUnionRect(result, [rect rect]);

  return [[self class] rectWithRect:result];
}

- (void)unionWith:(GKRect *)aRect {
  self.rect = NSUnionRect(self.rect, aRect.rect);
}

- (BOOL)intersectsWithRect:(GKRect *)otherRect {
  return NSIntersectsRect(self.rect, otherRect.rect);
}

@dynamic x, y, width, height;

- (CGFloat)x { return self.rect.origin.x; }
- (CGFloat)y { return self.rect.origin.y; }
- (CGFloat)width  { return self.rect.size.width; }
- (CGFloat)height { return self.rect.size.height; }

- (void)setX:(CGFloat)x { _rect.origin.x = x; }
- (void)setY:(CGFloat)y { _rect.origin.y = y; }
- (void)setWidth:(CGFloat)width   { _rect.size.width = width; }
- (void)setHeight:(CGFloat)height { _rect.size.height = height; }

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
  self.x = NSMinX(self.rect);
  self.y = NSMinY(self.rect);
  self.width = ABS(self.width);
  self.height = ABS(self.height);
}

- (void)scaleBy:(CGFloat)scale {
  self.x *= scale;
  self.y *= scale;
  self.width *= scale;
  self.height *= scale;
}

- (CGFloat )midX {
  return NSMidX(self.rect);
}

- (CGFloat)midY {
  return NSMidY(self.rect);
}

- (void)setMidX:(CGFloat)midX {
  self.x = midX - self.width/2;
}

- (void)setMidY:(CGFloat)midY {
  self.y = midY - self.height/2;
}

@dynamic origin, size;

- (NSPoint)origin {
  return NSMakePoint(self.x, self.y);
}

- (void)setOrigin:(NSPoint)origin {
  self.x = origin.x;
  self.y = origin.y;
}

- (NSSize)size {
  return NSMakeSize(self.width, self.height);
}

- (void)setSize:(NSSize)size {
  self.width = size.width;
  self.height = size.height;
}

@end
