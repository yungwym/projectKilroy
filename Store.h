//
//  Store.h
//  
//
//  Created by Alex Wymer  on 2017-07-26.
//
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property (nonatomic, strong) NSNumber *storeId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *addressLine1;
@property (nonatomic, strong) NSString *addressLine2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

-(instancetype)initWithInfo:(NSDictionary*)info;
@end
