//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

typedef enum GKEdgeType : NSUInteger {
  GKEdgeLeftMask          = 1,
  GKEdgeRightMask         = 2,
  GKEdgeTopMask           = 4,
  GKEdgeBottomMask        = 8,
  GKEdgeMidVerticalMask   = 16,
  GKEdgeMidHorizontalMask = 32 
} GKEdgeType;

static inline GKEdgeType GKEdgeFlip(GKEdgeType edge) {
  switch (edge) {
    case GKEdgeLeftMask:
      return GKEdgeRightMask;
    case GKEdgeRightMask:
      return GKEdgeLeftMask;
    case GKEdgeTopMask:
      return GKEdgeBottomMask;
    case GKEdgeBottomMask:
      return GKEdgeTopMask;
    default:
      return edge;
  }
}
