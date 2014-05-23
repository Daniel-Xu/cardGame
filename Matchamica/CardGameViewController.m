//
//  CardGameViewController.m
//  Matchamica
//
//  Created by Daniel-Xu on 5/21/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;



@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}


- (IBAction)touchCardButton:(UIButton *)sender {

    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
   
    [self.game chooseCardAtIndex:chosenButtonIndex];

    [self updateUI];
    
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;

    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Your score is: %ld", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen? card.contents : @"";

}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed: card.isChosen? @"frontBg":@"backBg"];
}

@end
