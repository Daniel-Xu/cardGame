
//  PlayingCard.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/22/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;


- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if([otherCards count] == 1){
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            if (self.rank == otherCard.rank) {
                score = 4;
            } else if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            }
        }

    }
    return score;
    
}


- (void)SetSuit:(NSString *)suit
{
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit? _suit : @"?";
}

+ (NSArray *)validSuit
{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",@"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    //in class method, self is class itself
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
