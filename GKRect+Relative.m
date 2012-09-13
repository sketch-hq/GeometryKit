//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect+Relative.h"

@implementation GKRect (Relative)

- (GKRect *)relativeRectInsideRect:(GKRect *)outerRect
{
  NSRect r = rect;
  r.origin.x    -= outerRect.x;
  r.origin.y    -= outerRect.y;
  r.origin.x    /= outerRect.width;
  r.origin.y    /= outerRect.height;
  r.size.width  /= outerRect.width;
  r.size.height /= outerRect.height;
  return [GKRect rectWithRect:r];
}

- (GKRect *)absoluteRectInsideRect:(GKRect *)outerRect
{
  NSRect r = rect;
  r.origin.x    *= outerRect.width;
  r.origin.y    *= outerRect.height;
  r.origin.x    += outerRect.x;
  r.origin.y    += outerRect.y;
  r.size.width  *= outerRect.width;
  r.size.height *= outerRect.height;
  return [GKRect rectWithRect:r];
}

- (void)translateFromRect:(GKRect *)outerRect1 toRect:(GKRect *)outerRect2
{
  self.rect = [[self relativeRectInsideRect:outerRect1] absoluteRectInsideRect:outerRect2].rect;
}

@end
