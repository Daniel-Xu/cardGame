//
//  PlayingCardDeck.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/22/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super  init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuit]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;

                [self addCard:card];
            }
        }
    }
    return self;
}

@end
