
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
    return @[@"?", @"♣︎", @"♥︎", @"♠︎", @""];
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
        rank = _rank;
    }
}

@end
