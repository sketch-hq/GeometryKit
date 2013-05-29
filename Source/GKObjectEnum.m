//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

@implementation GKObjectEnum

- (id)initWithType:(NSInteger)aType
{
  self = [super init];
  if (self)
    type = aType;
  return self;
}

- (id)copyWithZone:(NSZone *)zone
{
  return [[[self class] alloc] initWithType:type];
}

- (NSInteger)type
{
  return type;
}

- (void)setType:(NSInteger)newType
{
  type = newType;
}

- (BOOL)isEqual:(GKObjectEnum *)object
{
  return [self type] == [object type];
}
 
- (NSUInteger)hash
{
  return [super hash] + [@(type) hash];
}

- (NSString *)stringRepresentation
{
  return [NSString stringWithFormat:@"%i", (int)type];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ (%@)", [super description], [self stringRepresentation]];
}

@end
