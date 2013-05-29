//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@interface GKRect (Compare)
- (BOOL)containsRect:(GKRect *)otherRect;
- (BOOL)isContainedInRect:(GKRect *)otherRect;

- (BOOL)intersectsRect:(GKRect *)otherRect;

- (void)intersectWithRect:(GKRect *)otherRect;
- (GKRect *)unionWithRect:(GKRect *)otherRect;
@end
