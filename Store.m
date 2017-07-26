//
//  Store.m
//  
//
//  Created by Alex Wymer  on 2017-07-26.
//
//

#import "Store.h"

@implementation Store
- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        _storeId = info[@"id"];
        _name = info[@"name"];
        _tags = info[@"tags"];
        _addressLine1 = info[@"address_line_1"];
        _addressLine2 = info[@"address_line_2"];
        _city = info[@"city"];
        _postalCode = info[@"postal_code"];
        _latitude = info[@"latitude"];
        _longitude = info[@"longitude"];
    }
    return self;
}

@end
