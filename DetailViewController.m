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
    // Do any additional setup after loading the view.
    
    self.title = @""; //name
}


- (IBAction)mapTapped:(UIButton *)sender {
    
    
}

@end
