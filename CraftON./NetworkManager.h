//
//  NetworkManager.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

@import UIKit;

@class BeerCollectionViewCell;
@class Beer;

@interface NetworkManager : NSObject

- (void)performRequest:(NSString*)query completionHandler:(void (^)(NSArray*))complete;
- (void)fetchImageAtURL:(NSURL*)url handler:(void (^)(UIImage *image))handler;
- (void)performStoreRequest:(NSString*)query completionHandler:(void (^)(NSArray*))complete;

@end
