//
//  ImageObject.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        
        _defaultImage = image;
        
    }
    return self;
}
@end
