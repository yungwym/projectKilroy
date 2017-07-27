//
//  DetailViewController.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "NetworkManager.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Beer *myBeer;
@property (strong, nonatomic) NetworkManager *networkManager;

@end
