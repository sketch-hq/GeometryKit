//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <SketchModel/MSRect.h>
#import "GKRect.h"

@implementation GKRect
@dynamic midX, midY;

+ (instancetype)rectWithRect:(NSRect)aRect {
  return [[self alloc] initWithRect:aRect];
}

- (id)initWithRect:(NSRect)aRect {
  self = [super init];
  if (self)
    _rect = aRect;
  return self;
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

- (id)copyWithZone:(NSZone *)zone {
  return [[self class] rectWithRect:self.rect];
}

- (BOOL)isEqual:(GKRect *)object {
  if ([self class] == [object class])
    return NSEqualRects(self.rect, object.rect);
  else
    return NO;
}

- (NSString *)description {
  return NSStringFromRect(self.rect);
}

- (void)scaleBy:(CGFloat)scale {
  self.x *= scale;
  self.y *= scale;
  self.width *= scale;
  self.height *= scale;
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
