//
//  BeerCollectionViewCell.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "BeerCollectionViewCell.h"
#import "ImageObject.h"
#import "Beer.h"

@implementation BeerCollectionViewCell

- (void)setBeer:(Beer *)beer
{
    _beer = beer;
    self.beerImageView.image = _beer.beerImage;
}

@end
