//
//  Beer.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Beer : NSObject

@property (strong, nonatomic) NSString *beerID;
@property (strong, nonatomic) NSString *beerName;
@property (strong, nonatomic) UIImage *beerImage;
@property (strong, nonatomic) NSURL *beerURL;
@property (strong, nonatomic) NSNumber *beerABV;
@property (strong, nonatomic) NSString *beerTag;
@property (strong, nonatomic) NSString *beerSecondaryCategory;
@property (strong, nonatomic) NSString *beerTertiaryCategory;
@property (strong, nonatomic) NSString *beerProducer;
@property (strong, nonatomic) NSString *beerOrigin;

- (instancetype)initWithID:(NSString*)beerID andName:(NSString*)beerName andImage:(UIImage*)beerImage andURL:(NSURL*)beerURL andABV:(NSNumber*)beerABV andTag:(NSString*)beerTag andSecondaryCategory:(NSString*)beerSecondaryCategory andTertiaryCategory:(NSString*)beerTertiaryCategory andProducer:(NSString*)beerProducer andOrigin:(NSString*)beerOrigin;



@end
