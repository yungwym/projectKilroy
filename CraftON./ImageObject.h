//
//  ImageObject.h
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-26.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageObject : NSObject

@property (strong, nonatomic) UIImage *defaultImage;

- (instancetype) initWithImage:(UIImage*) image;

@end
