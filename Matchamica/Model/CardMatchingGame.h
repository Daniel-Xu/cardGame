//
//  CardMatchingGame.h
//  Matchamica
//
//  Created by Daniel-Xu on 5/22/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
@property (nonatomic, readonly) NSInteger score;

- (CardMatchingGame *)initWithCardCount:(NSUInteger)cardCound
                              usingDeck:(Deck *)deck;

- (Card *)cardAtIndex:(NSUInteger)index;

- (void)chooseCardAtIndex:(NSUInteger)index;
@end

