//
//  CRMCard.m
//  DeckOfCardsHybrid
//
//  Created by Cameron Milliken on 2/12/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMCard.h"

@implementation CRMCard

// MARK: - Initialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = [cards firstObject];
        NSString *imageUrlAsString = cardDictionary[@"image"];
        _imageURLAsString = imageUrlAsString;
    }
    return self;
}

@end
