//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UIButton *cardButton;

@end

@implementation ViewController

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
    Card *completeMatchingCard = [[Card alloc] init];
    completeMatchingCard.contents = @"A♠";
    [_deck addCard:completeMatchingCard];
    Card *variantCard = [[Card alloc] init];
    variantCard.contents = @"Joker";
    [_deck addCard:variantCard];
    return _deck;
}

    int i = 0;

- (IBAction)cardButtonTapped:(UIButton *)sender {
    i++;
    
    [myLabel setText:[NSString stringWithFormat:@"%i", i]];
    
    if (self.deck) {
        if ([sender.currentTitle length]) {
            [sender setTitle:@""
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        } else {
            Card *card = [self.deck drawRandomCard];
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            if ([card isMemberOfClass:[Card class]]) {
                if ([card.contents rangeOfString:@"♠"].location != NSNotFound) {
                    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                else {
                    [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                }
            }
            else if ([card isMemberOfClass:[PlayingCard class]]){
                if ([[(PlayingCard *)card suit] rangeOfString:@"♦"].location != NSNotFound
                    || [[(PlayingCard *)card suit] rangeOfString:@"♥"].location != NSNotFound) {
                    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                } else {
                    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
            }
        }
	}
}


- (IBAction)cardFlipped:(UIButton *)sender {
    if (![sender.currentTitle length]) {
        NSLog(@"Card was flipped");
    } else {
        if ([[sender titleForState:UIControlStateNormal] rangeOfString:@"♦"].location != NSNotFound
            || [[sender titleForState:UIControlStateNormal] rangeOfString:@"♥"].location != NSNotFound
            || [[sender titleForState:UIControlStateNormal] rangeOfString:@"♣"].location != NSNotFound
            || [[sender titleForState:UIControlStateNormal] rangeOfString:@"♠"].location != NSNotFound) {
            NSLog(@"Drawm playing card %@", [sender titleForState:UIControlStateNormal]);
        } else
            NSLog(@"Drawn card %@", [sender titleForState:UIControlStateNormal]);
    }
    if (!self.deck) {
        NSLog(@"Deck is Empty");
    }
}

@end
