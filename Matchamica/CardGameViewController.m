//
//  CardGameViewController.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/21/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"


@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {



    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"backBg"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *randomCard = [self.deck drawRandomCard];
        if(randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"frontBg"]
                              forState:UIControlStateNormal];
            [sender setTitle: randomCard.contents forState:UIControlStateNormal];

        }
    }

    self.flipCount++;
    
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    
    return _deck;
}

@end
