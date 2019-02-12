//
//  CRMCardController.h
//  DeckOfCardsHybrid
//
//  Created by Cameron Milliken on 2/12/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMCardController : NSObject

+ (void)fetchCardWithCompletion: (void (^) (CRMCard * _Nullable))completion;

+ (void)fetchCardImageWith: (CRMCard * _Nullable)card
                completion: (void (^) (UIImage *))completion;


@end

NS_ASSUME_NONNULL_END
