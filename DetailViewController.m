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
@property (weak, nonatomic) IBOutlet UIButton *findMeButton;


@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelCollection;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureBeer];
    
    self.title = self.myBeer.beerProducer; //name

    [self fancyUI]; 
}

- (void)configureBeer
{
    //float ABVpercent = self.myBeer.beerABV.floatValue / 100;
    //float ABVpercent = ABVfloat/100;
    //NSString *ABVString = [self.myBeer.beerABV stringValue];
    
    self.detailCraftImageView.image = self.myBeer.beerImage;
   
    self.categoryLabel.text = [NSString stringWithFormat:@"Category: %@",self.myBeer.beerSecondaryCategory];
    self.abvLabel.text = [NSString stringWithFormat:@"ABV: %.2f %%",self.myBeer.beerABV.doubleValue / 100];
    self.brewerLabel.text = self.myBeer.beerName; //Switch brewer with name
    self.descriptionLabel.text = self.myBeer.beerTag;
}

- (IBAction)mapTapped:(UIButton *)sender {
    
    
}

-(void)fancyUI {
    
    UIColor *myColor = [UIColor colorWithRed:(53/255.0) green:(58/255.0) blue:(82/255.0) alpha:1.0];
    
    self.detailCraftImageView.layer.borderColor = myColor.CGColor;
    self.detailCraftImageView.layer.borderWidth = 4.0;
    self.detailCraftImageView.layer.cornerRadius = 10.0;
    
    self.findMeButton.layer.borderColor = myColor.CGColor;
    self.findMeButton.layer.borderWidth = 4.0;
    self.findMeButton.layer.cornerRadius = 10.0;
    
    for (UILabel *l in self.labelCollection) {
        
        l.layer.backgroundColor = myColor.CGColor;
        l.layer.cornerRadius = 10.0;
    }
}
@end
