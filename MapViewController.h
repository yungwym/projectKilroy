//
//  MapViewController.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;
@class Beer;

@interface MapViewController : UIViewController

@property (strong, nonatomic) Beer *beer;
@property (strong, nonatomic) NSArray *stores;

@end
