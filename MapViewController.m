//
//  MapViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "NetworkManager.h"
#import "Beer.h"

@interface MapViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) NetworkManager *networkManager;
@property (nonatomic) GMSMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) Store *currentClosestLocation;
@property (strong, nonatomic) CLLocation *currentUserLocation;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                                            longitude:0
                                                                 zoom:15];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    
    self.networkManager = [NetworkManager new];
    [self.networkManager performStoreRequest:[NSString stringWithFormat:@"907147"] completionHandler:^(NSArray *stores)
     {
         self.stores = stores;
         // ****************** find the closest location *******************
         
         
         
         //self.currentClosestLocation = [[Store alloc]init];
         
         //CLLocation *currentUserLocation = [[CLLocation alloc]initWithLatitude:10.0 longitude:10.0];
         //CLLocation *currentUserLocation = [[CLLocation alloc]initWithLatitude:43.644645 longitude:-79.394999];
         CLLocation *currentUserLocation = self.currentUserLocation;
         
         // query results
         NSArray<Store*>*locationsFromQuery = stores;
         
         if (locationsFromQuery.count < 1) {
             // alert the user that this isn't available anywhere
         }
         
         for (Store *s in locationsFromQuery) {
             if (self.currentClosestLocation == nil) {
                 self.currentClosestLocation = s;
                 continue;
             }
             
             NSNumber *latOfStore = s.latitude;
             NSNumber *lngOfStore = s.longitude;
             
             CLLocation *storeLocation = [[CLLocation alloc] initWithLatitude:[latOfStore doubleValue] longitude:[lngOfStore doubleValue]];
             
             CLLocationDistance distanceBetweenCurrentStoreAndUser = [storeLocation distanceFromLocation:currentUserLocation];
             
             CLLocation *currentClosestCLLocation = [[CLLocation alloc] initWithLatitude:[self.currentClosestLocation.latitude doubleValue] longitude:[self.currentClosestLocation.longitude doubleValue]];
             
             CLLocationDistance distanceBetweenClosestLocationAndUser = [currentClosestCLLocation distanceFromLocation:currentUserLocation];

             
             if (distanceBetweenCurrentStoreAndUser < distanceBetweenClosestLocationAndUser) {
                 self.currentClosestLocation = s;
             }
             
         }
         NSLog(@"Closest store is: %f, %f", [[self.currentClosestLocation latitude] floatValue], [[self.currentClosestLocation longitude] floatValue]);
         
         float latitude = [self.currentClosestLocation.latitude floatValue];
         float longitude = [self.currentClosestLocation.longitude floatValue];
         NSString *name = self.currentClosestLocation.storeName;
         NSString *city = self.currentClosestLocation.storeCity;
         
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
             // Creates a marker in the center of the map.
             GMSMarker *marker = [[GMSMarker alloc] init];
             marker.position = CLLocationCoordinate2DMake(latitude, longitude);
             marker.title = name;
             marker.snippet = city;
             marker.map = mapView;
             
             
             GMSCameraPosition *newCamera = [[GMSCameraPosition alloc] initWithTarget:marker.position zoom:15 bearing:0 viewingAngle:0];
             
             [((GMSMapView *)self.view) setCamera:newCamera];
         }];
         
     }];
  
    
    
    /*
     
     //Testing
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:43.6453
                                                            longitude:-79.3946
                                                                 zoom:13];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
    NSLog(@"User's location: %@", self.mapView.myLocation);
    
    // Creates a marker.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(43.6453, -79.3946);
    marker.title = @"King & Spadina";
    marker.snippet = @"Toronto";
    marker.map = self.mapView;
    
    */
    
    
    
    
    

    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *lastLocation = [locations lastObject];
    self.currentUserLocation = lastLocation;
    
    GMSMarker *marker = [GMSMarker markerWithPosition:lastLocation.coordinate];
    self.mapView.myLocationEnabled = YES;
    marker.title = @"My Location";
    marker.map = self.mapView;
    
}



@end
