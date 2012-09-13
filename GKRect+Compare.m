//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect+Compare.h"

@implementation GKRect (Compare)

- (BOOL)containsRect:(GKRect *)otherRect
{
  return NSContainsRect(self.rect, otherRect.rect);
}

- (BOOL)isContainedInRect:(GKRect *)otherRect
{
  return [otherRect containsRect:self];
}

- (BOOL)intersectsRect:(GKRect *)otherRect
{
  return NSIntersectsRect(self.rect, otherRect.rect);
}

- (GKRect *)intersectWithRect:(GKRect *)otherRect
{
  rect = NSIntersectionRect(self.rect, otherRect.rect);
  return self;
}

- (GKRect *)unionWithRect:(GKRect *)otherRect
{
  rect = NSUnionRect(self.rect, otherRect.rect);
  return self;
}

@end
