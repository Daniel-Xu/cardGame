//
//  PlayingCard.h
//  Matchamica
//
//  Created by Daniel-Xu on 5/22/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *)validSuit;
+ (NSUInteger)maxRank;

@end
