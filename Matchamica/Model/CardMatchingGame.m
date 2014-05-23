//
//  CardMatchingGame.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/22/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()
//this will make score readwrite in this class
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of card

@end


@implementation CardMatchingGame


-(NSMutableArray *)cards
{
    //make sure _cards are array at least;
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

//designated init
-(CardMatchingGame *)initWithCardCount:(NSUInteger)cardCound usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < cardCound; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}



static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int CHOSEN_COST = 1;
-(void)chooseCardAtIndex:(NSUInteger)index
{
    //main logic is here
    
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //is not been choosen
            
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                    break;
                }
            }
            self.score -= CHOSEN_COST;
            card.chosen = YES;
        
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]: nil;
}


@end
