//
//  Card.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/21/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *) otherCards
{
    int score = 0;
    
    if([otherCards count]){
    
        for (Card *card in otherCards) {
            if ([card.contents isEqualToString:self.contents]) {
                score = 1;
            }
        }
    }
    return score;
}
@end
