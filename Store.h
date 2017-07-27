//
//  Store.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (nonatomic, strong) NSNumber *storeID;
@property (nonatomic, strong) NSString *storeName;
@property (nonatomic, strong) NSString *storeTags;
@property (nonatomic, strong) NSString *storeAddress1;
@property (nonatomic, strong) NSString *storeAddress2;
@property (nonatomic, strong) NSString *storeCity;
@property (nonatomic, strong) NSString *storePostalCode;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

- (instancetype)initWithID:(NSNumber*)storeID andName:(NSString*)storeName andTags:(NSString*)storeTags andAddress1:(NSString*)storeAddress1 andAdress2:(NSString*)storeAddress2 andCity:(NSString*)storeCity andPostalCode:(NSString*)storePostalCode andLatitude:(NSNumber*)latitude andLongitude:(NSNumber*)longitude;

@end
