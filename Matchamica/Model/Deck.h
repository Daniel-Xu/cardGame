//
//  Deck.h
//  Matchamica
//
//  Created by Daniel-Xu on 5/21/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"    

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
