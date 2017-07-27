//
//  Store.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "Store.h"

@implementation Store

- (instancetype)initWithID:(NSNumber*)storeID andName:(NSString*)storeName andTags:(NSString*)storeTags andAddress1:(NSString*)storeAddress1 andAdress2:(NSString*)storeAddress2 andCity:(NSString*)storeCity andPostalCode:(NSString*)storePostalCode andLatitude:(NSNumber*)latitude andLongitude:(NSNumber*)longitude
{
    self = [super init];
    if (self) {
        _storeID = storeID;
        _storeName = storeName;
        _storeTags = storeTags;
        _storeAddress1 = storeAddress1;
        _storeAddress2 = storeAddress2;
        _storeCity = storeCity;
        _storePostalCode = storePostalCode;
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}
@end
