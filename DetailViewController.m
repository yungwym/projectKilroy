//
//  DetailViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *detailCraftImageView; //image-thumb
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel; // terttiary
@property (weak, nonatomic) IBOutlet UILabel *brewerLabel; //producerName
@property (weak, nonatomic) IBOutlet UILabel *abvLabel; //alchol content / 100
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel; // tags

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureBeer];
    
    self.title = self.myBeer.beerName; //name
}

- (void)configureBeer
{
    //float ABVpercent = self.myBeer.beerABV.floatValue / 100;
    //float ABVpercent = ABVfloat/100;
    //NSString *ABVString = [self.myBeer.beerABV stringValue];
    
    self.detailCraftImageView.image = self.myBeer.beerImage;
    self.abvLabel.text = [NSString stringWithFormat:@"Hello %@", self.myBeer.beerABV];
    self.brewerLabel.text = self.myBeer.beerProducer;
    self.descriptionLabel.text = self.myBeer.beerTag;
}

- (IBAction)mapTapped:(UIButton *)sender {
    
    
}

@end
