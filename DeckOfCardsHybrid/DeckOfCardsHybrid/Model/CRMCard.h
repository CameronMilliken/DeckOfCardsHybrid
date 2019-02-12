//
//  CRMCard.h
//  DeckOfCardsHybrid
//
//  Created by Cameron Milliken on 2/12/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMCard : NSObject

//Properties
@property (nonatomic, readonly) NSString *imageURLAsString;

//Init
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
