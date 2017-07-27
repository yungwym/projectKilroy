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

@property (weak, nonatomic) IBOutlet UIView *coverView;

@end

@implementation MenuViewController

- (void)setBeers:(NSArray *)beers
{
    
    _beers = beers;
    dispatch_queue_t mainQ = dispatch_get_main_queue();
    dispatch_async(mainQ, ^{
        [self.collectionView reloadData];
        
       // self.coverView.hidden = YES;
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coverView.hidden = YES;
    
    self.networkManager = [NetworkManager new];
    [self.networkManager performRequest:@"craft+beer&per_page=50&page=1" completionHandler:^(NSArray *beers)
     {
         self.beers = beers;
         [self.collectionView reloadData];
     }];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil
                                                                  action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    
  //  [self fancyUI];

}

- (IBAction)segmentTapped:(UISegmentedControl *)sender {
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        
        self.networkManager = [NetworkManager new];
        [self.networkManager performRequest:@"craft+beer&per_page=50&page=1" completionHandler:^(NSArray *beers)
         {
             self.beers = beers;
             [self.collectionView reloadData];
             self.coverView.hidden = YES;
         }];
        
    } else if (selectedSegment == 1 ) {
        
        self.networkManager = [NetworkManager new];
        [self.networkManager performRequest:@"beer+lager&per_page=50&page=1" completionHandler:^(NSArray *beers)
         {
             self.beers = beers;
             [self.collectionView reloadData];
             self.coverView.hidden = YES;
         }];
       
    } else if (selectedSegment == 2) {
        
        self.networkManager = [NetworkManager new];
        [self.networkManager performRequest:@"beer+ale&per_page=50&page=1" completionHandler:^(NSArray *beers)
         {
             self.beers = beers;
             [self.collectionView reloadData];
             self.coverView.hidden = YES;
         }];
    }
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
    
    [self fancyUI:cell];
    
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





-(void)fancyUI:(BeerCollectionViewCell *)cell {
    
    cell.layer.borderColor = [UIColor colorWithRed:(53/255.0) green:(58/255.0) blue:(82/255.0) alpha:1.0].CGColor;
    cell.layer.borderWidth = 4.0;
    cell.layer.cornerRadius = 10.0;
}





@end
