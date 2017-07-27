//
//  DetailViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "Key.h"
#import "Store.h"
#import "MapViewController.h"

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

- (IBAction)mapTapped:(UIButton *)sender
{
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://lcboapi.com/stores?product_id=%@&access_key=%@", self.myBeer.beerID, LCBO_APIKEY]];
//    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
//                                                completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error)
//                                      {
//                                          if (error)
//                                          {
//                                              NSLog(@"error: %@", error.localizedDescription);
//                                              return;
//                                          }
//                                          
//                                          NSError *jsonError = nil;
//                                          NSDictionary *dictJSON  = [NSJSONSerialization JSONObjectWithData:data
//                                                                                                    options:0
//                                                                                                      error:&jsonError];
//                                          if (jsonError)
//                                          {
//                                              NSLog(@"jsonError: %@", jsonError.localizedDescription);
//                                              return;
//                                          }
//                                          
//                                          NSMutableArray <Store*>*stores = [@[] mutableCopy];
//                                          NSArray *storeArray = [dictJSON valueForKey:@"result"];
//                                          
//                                          for (NSDictionary *myStore in storeArray)
//                                          {
//                                              NSNumber *storeID = [myStore valueForKey:@"id"];
//                                              NSString *storeName = [myStore valueForKey:@"name"];
//                                              NSString *storeTags = [myStore valueForKey:@"tags"];
//                                              NSString *storeAddress1 = [myStore valueForKey:@"address_line_1"];
//                                              NSString *storeAddress2 = [myStore valueForKey:@"address_line_2"];
//                                              NSString *storeCity = [myStore valueForKey:@"city"];
//                                              NSString *storePostalCode = [myStore valueForKey:@"postal_code"];
//                                              NSNumber *latitudeNumber = [myStore valueForKey:@"latitude"];
//                                              NSNumber *longitudeNumber = [myStore valueForKey:@"longitude"];
//                                              
//                                              float latitude = latitudeNumber.floatValue;
//                                              float longitude = longitudeNumber.floatValue;
//                                              NSLog(@"latitude: %f & longitude: %f", latitude, longitude);
//                                              
//                                              Store *store = [[Store alloc]initWithID:storeID andName:storeName andTags:storeTags andAddress1:storeAddress1 andAdress2:storeAddress2 andCity:storeCity andPostalCode:storePostalCode andLatitude:latitudeNumber andLongitude:latitudeNumber];
//                                              
//                                              [stores addObject:store];
//                                          }
//                                      }];
//    
//    [dataTask resume];
//    
//    
//    
////    [self performSegueWithIdentifier:@"map" sender:self];
////    MapViewController *dvc = self
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"map"])
    {
        MapViewController *dvc = segue.destinationViewController;
        dvc.beer = self.myBeer;
    }
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
