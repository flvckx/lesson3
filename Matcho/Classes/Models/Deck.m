//
//  Deck.m
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	return _cards;
}


- (void)addCard:(Card *)card {
	[self addCard:card atTop:NO];
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop {
	if (atTop) {
		[self.cards insertObject:card atIndex:0];
	} else {
		[self.cards addObject:card];
	}
}

- (Card *)drawRandomCard {
	NSInteger randomCard = arc4random() % [self.cards count];
    if (self.cards) {
        for (PlayingCard* card in self.cards) {
            if ([card.contents isEqualToString:self.cards[randomCard]]) {
                [self.cards removeObject:card];
            }
        }
    }
        return self.cards[randomCard];
}
@end
