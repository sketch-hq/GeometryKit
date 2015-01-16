// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

@class GKRect;

@interface GKLine : NSObject
@property (nonatomic) BCAxis axis;
@property (nonatomic) CGFloat position;

+ (GKLine *)lineOnAxis:(BCAxis)axis position:(CGFloat)position;

- (BOOL)snapToRect:(GKRect *)rect margin:(CGFloat)margin;

+ (NSArray *)sortLines:(NSArray *)lines byDistanceToValue:(CGFloat)value;
@end
