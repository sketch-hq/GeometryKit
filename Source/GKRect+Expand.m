//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Expand.h"

@implementation GKRect (Expand)

// Note: this method or property is publicly documented in the Scripting API Docs
- (GKRect *)expandBy:(CGFloat)offset
{
  return [self expandXBy:offset yBy:offset];
}

- (GKRect *)expandXBy:(CGFloat)xOffset yBy:(CGFloat)yOffset
{
  return [self insetXBy:-xOffset yBy:-yOffset];
}

- (GKRect *)insetBy:(CGFloat)inset
{
  return [self insetXBy:inset yBy:inset];
}

- (GKRect *)insetXBy:(CGFloat)xInset yBy:(CGFloat)yInset
{
  self.rect = NSInsetRect(self.rect, xInset, yInset);
  return self;
}

- (GKRect *)moveBy:(NSSize)offset
{
  self.x += offset.width;
  self.y += offset.height;
  return self;
}

@end
