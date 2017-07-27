//
//  MenuViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "MenuViewController.h"
#import "BeerCollectionViewCell.h"
#import "DetailViewController.h"
#import "NetworkManager.h"
#import "ImageObject.h"
#import "Beer.h"

@interface MenuViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl; // segments categorized by the secondary, crafts, lager and ale
@property (strong, nonatomic) NSArray *beers;
@property (strong, nonatomic) NetworkManager *networkManager;

@end

@implementation MenuViewController

- (void)setBeers:(NSArray *)beers
{
    _beers = beers;
    dispatch_queue_t mainQ = dispatch_get_main_queue();
    dispatch_async(mainQ, ^{
        [self.collectionView reloadData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.networkManager = [NetworkManager new];
    [self.networkManager performRequest:@"products?q=beer+ale&per_page=50&page=1" completionHandler:^(NSArray *beers)
     {
         self.beers = beers;
     }];
}

#pragma mark - Datasource/Delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.beers.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BeerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    Beer *beer = self.beers[indexPath.row];
    cell.beer = beer;
    
    if (!beer.beerImage) // HERE SHOULD BE IMAGE OBJECT
    {
        [self.networkManager fetchImageAtURL:beer.beerURL handler:^(UIImage *image) {
            dispatch_queue_t mainQ = dispatch_get_main_queue();
            dispatch_async(mainQ, ^{
                ImageObject *imageObject = [[ImageObject alloc] initWithImage:image];
                beer.beerImage = imageObject.defaultImage; // HERE SHOULD BE IMAGEOBJECT
                cell.beer = beer;
            });
        }];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        Beer *beer = self.beers[indexPath.row];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.myBeer = beer;
    }
}

- (IBAction)segmentTapped:(UISegmentedControl *)sender {
    
    
}



@end
