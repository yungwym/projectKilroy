//
//  BeerCollectionViewCell.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Beer;

@interface BeerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *beerImageView; //image_thumb
@property (strong, nonatomic) Beer *beer;

@end
