//
//  PlayingCard.m
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

+ (NSArray *)suits {
    return @[@"♣", @"♠", @"♦", @"♥"];
}

+ (NSArray *)ranks {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return ([[PlayingCard ranks] count] - 1);
}

-(instancetype) initWithSuit:(NSString *)suit andRank:(NSInteger)rank {
	self = [super init];
	if (self) {
		self.suit = suit;
		self.rank = rank;
	}
	return self;
}


-(void)	setSuit:(NSString *)suit {
	if ([[PlayingCard suits] containsObject:suit]) {
		_suit = suit;
	}
}


-(void) setRank:(NSUInteger)rank {
	if (rank <= [PlayingCard maxRank]) {
		_rank = rank;
	}
}


-(NSString *) contents {
	return [NSString stringWithFormat:@"%@%@", [PlayingCard ranks][self.rank], self.suit];
}


-(int) match:(NSArray *)otherCards {
    int i = 0;    
    for (Card *card in otherCards) {
        if ([card isMemberOfClass:[PlayingCard class]]) {
            if ([self.suit isEqualToString:[(PlayingCard *)card suit]]) {
                i++;
            }
            if (self.rank == [(PlayingCard *)card rank]) {
                i += 4;
            }
        } else if ([self.contents isEqualToString:card.contents]) {
            i = 10;
        }
    }
	return i;
}


@end
