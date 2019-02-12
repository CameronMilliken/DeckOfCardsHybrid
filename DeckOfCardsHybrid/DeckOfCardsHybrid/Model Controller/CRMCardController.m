//
//  CRMCardController.m
//  DeckOfCardsHybrid
//
//  Created by Cameron Milliken on 2/12/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMCardController.h"
#import "CRMCard.h"


@implementation CRMCardController

+ (void)fetchCardWithCompletion:(void (^)(CRMCard *))completion
{
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", baseUrl.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"there was an error getting the card");
            completion(nil);
            return;
        }
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (cardDictionary == nil) {
            completion(nil);
            return;
        }
        
        CRMCard *card = [[CRMCard alloc] initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
}
+ (void)fetchCardImageWith:(CRMCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    //Image URL
    NSURL *imageUrl = [NSURL URLWithString:[card imageURLAsString]];
    
    //DataTask and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        //Check response
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data == nil) {
            NSLog(@"there was an error getting the card");
            completion(nil);
            return;
        }
        UIImage *cardImage = [[UIImage alloc] initWithData:data];
        completion(cardImage);
        
    }]resume];
    
}
    



@end
