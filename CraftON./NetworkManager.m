//
//  NetworkManager.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "NetworkManager.h"
#import "Key.h"
#import "BeerCollectionViewCell.h"
#import "Beer.h"
#import "Store.h"


@implementation NetworkManager

//- (NSURL*)endPointURL:(NSString*)LCBO_APIKEY
//{
//    return nil;
//}


- (void)performRequest:(NSString*)query completionHandler:(void (^)(NSArray*))complete
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://lcboapi.com/products?q=%@&access_key=%@", query, LCBO_APIKEY]];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"error: %@", error.localizedDescription);
                                              return;
                                          }
                                          
                                          NSError *jsonError = nil;
                                          NSDictionary *dictJSON  = [NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:0
                                                                                                      error:&jsonError];
                                          if (jsonError)
                                          {
                                              NSLog(@"jsonError: %@", jsonError.localizedDescription);
                                              return;
                                          }
                                          
                                          complete([self convertJSONToPhotos:dictJSON]);
                                          
                                      }];
    [dataTask resume];
}

- (NSArray*)convertJSONToPhotos:(NSDictionary*)json
{
    NSArray *beersArray = json[@"result"];
    
    //NSMutableArray *result = [[NSMutableArray alloc]init];
    NSMutableArray *result = [[NSMutableArray alloc]initWithCapacity:beersArray.count];
    
    for (NSDictionary *dict in beersArray)
    {
        NSString *beerURLString = dict[@"image_thumb_url"];
        NSNumber *beerID = dict[@"id"];
        NSString *beerName = dict[@"name"];
        NSNumber *beerABV = dict[@"alcohol_content"];
        NSString *beerTag = dict[@"tags"];
        NSString *beerSecondaryCategory = dict[@"secondary_category"];
        NSString *beerTertiaryCategory = dict[@"tertiary_category"];
        NSString *beerProducer = dict[@"producer_name"];
        NSString *beerOrigin = dict[@"origin"];
        
        NSURL *beerURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",beerURLString]];
        NSData *data = [NSData dataWithContentsOfURL:beerURL];
        UIImage *beerImage = [UIImage imageWithData:data];
        
        // error check for missing URLs
        if (beerURLString == (id) [NSNull null] || [beerURLString length] == 0 || [beerURLString isEqualToString:@""])
        {
            continue;
        }
        // create objects
        Beer *beer = [[Beer alloc] initWithID:beerID andName:beerName andImage:(UIImage*)beerImage andURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",beerURL]] andABV:beerABV andTag:beerTag andSecondaryCategory:beerSecondaryCategory andTertiaryCategory:beerTertiaryCategory andProducer:beerProducer andOrigin:beerOrigin];
        
        [result addObject:beer];
    }
    return result;
}

- (void)fetchImageAtURL:(NSURL*)url handler:(void (^)(UIImage *image))handler
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        handler(image);
    }];
    [downloadTask resume];
}

- (void)performStoreRequest:(NSString*)query completionHandler:(void (^)(NSArray*))complete
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://lcboapi.com/stores?product_id=%@&access_key=%@", query, LCBO_APIKEY]];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"error: %@", error.localizedDescription);
                                              return;
                                          }
                                          
                                          NSError *jsonError = nil;
                                          NSDictionary *dictJSON  = [NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:0
                                                                                                      error:&jsonError];
                                          if (jsonError)
                                          {
                                              NSLog(@"jsonError: %@", jsonError.localizedDescription);
                                              return;
                                          }
                                          
                                          complete([self convertJSONToStores:dictJSON]);
                                          
                                      }];
    [dataTask resume];
}

- (NSArray*)convertJSONToStores:(NSDictionary*)json
{
    NSArray *storesArray = json[@"result"];
    NSMutableArray *result = [[NSMutableArray alloc]initWithCapacity:storesArray.count];
    
    for (NSDictionary *myStore in storesArray)
    {
        NSNumber *storeID = [myStore valueForKey:@"id"];
        NSString *storeName = [myStore valueForKey:@"name"];
        NSString *storeTags = [myStore valueForKey:@"tags"];
        NSString *storeAddress1 = [myStore valueForKey:@"address_line_1"];
        NSString *storeAddress2 = [myStore valueForKey:@"address_line_2"];
        NSString *storeCity = [myStore valueForKey:@"city"];
        NSString *storePostalCode = [myStore valueForKey:@"postal_code"];
        NSNumber *latitudeNumber = [myStore valueForKey:@"latitude"];
        NSNumber *longitudeNumber = [myStore valueForKey:@"longitude"];
        
        float latitude = latitudeNumber.floatValue;
        float longitude = longitudeNumber.floatValue;
        NSLog(@"latitude: %f & longitude: %f", latitude, longitude);
        
        Store *store = [[Store alloc]initWithID:storeID andName:storeName andTags:storeTags andAddress1:storeAddress1 andAdress2:storeAddress2 andCity:storeCity andPostalCode:storePostalCode andLatitude:latitudeNumber andLongitude:latitudeNumber];
        
        [result addObject:store];
    }
    return result;
}


@end
