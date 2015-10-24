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
    Card *completeMatchingCard = [_deck.cards firstObject];
    [_deck addCard:completeMatchingCard];
    Card *variantCard = [[Card alloc] init];
    variantCard.contents = @"Joker";
    [_deck addCard:variantCard];
    return _deck;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
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
	}
}

@end
