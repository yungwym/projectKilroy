//
//  Beer.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (instancetype)initWithID:(NSString *)beerID andName:(NSString *)beerName andImage:(UIImage*)beerImage andURL:(NSURL *)beerURL andABV:(NSNumber*)beerABV andTag:(NSString *)beerTag andSecondaryCategory:(NSString *)beerSecondaryCategory andTertiaryCategory:(NSString *)beerTertiaryCategory andProducer:(NSString *)beerProducer andOrigin:(NSString *)beerOrigin
{
    self = [super init];
    if (self) {
        _beerID = beerID;
        _beerName = beerName;
        _beerURL = beerURL;
        _beerABV = beerABV;
        _beerTag = beerTag;
        _beerSecondaryCategory = beerSecondaryCategory;
        _beerTertiaryCategory = beerTertiaryCategory;
        _beerProducer = beerProducer;
        _beerOrigin = beerOrigin;
        _beerImage = beerImage;
    }
    return self;
}

@end
