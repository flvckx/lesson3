//
//  Deck.h
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

@import Foundation;

#import "Card.h"
#import "PlayingCard.h"

@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
