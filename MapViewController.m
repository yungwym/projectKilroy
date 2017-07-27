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

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.networkManager = [NetworkManager new];
    [self.networkManager performStoreRequest:[NSString stringWithFormat:@"%@", self.myBeer.beerID] completionHandler:^(NSArray *stores)
     {
         self.stores = stores;
     }];
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    
    // ****************** find the closest location *******************
    
    
    
    Store *currentClosestLocation = [[Store alloc]init];
    
    CLLocation *currentUserLocation = [[CLLocation alloc]initWithLatitude:10.0 longitude:10.0];
    
    // query results
    NSArray<Store*>*locationsFromQuery = self.stores;
    
    if (locationsFromQuery.count < 1) {
        // alert the user that this isn't available anywhere
    }
    
    for (Store *s in locationsFromQuery) {
        if (currentClosestLocation == nil) {
            currentClosestLocation = s;
            continue;
        }
        
        NSNumber *latOfStore = s.latitude;
        NSNumber *lngOfStore = s.longitude;
        
        CLLocation *storeLocation = [[CLLocation alloc] initWithLatitude:[latOfStore doubleValue] longitude:[lngOfStore doubleValue]];
        
        CLLocationDistance distanceBetweenCurrentStoreAndUser = [storeLocation distanceFromLocation:currentUserLocation];
        
        CLLocation *currentClosestCLLocation = [[CLLocation alloc] initWithLatitude:[currentClosestLocation.latitude doubleValue] longitude:[currentClosestLocation.longitude doubleValue]];
        
        CLLocationDistance distanceBetweenClosestLocationAndUser = [currentClosestCLLocation distanceFromLocation:currentUserLocation];
        
        if (distanceBetweenCurrentStoreAndUser < distanceBetweenClosestLocationAndUser) {
            currentClosestLocation = s;
        }
        
    }
    
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
    
    
    
    int latitude = [currentClosestLocation.latitude intValue];
    int longitude = [currentClosestLocation.longitude intValue];
    NSString *name = currentClosestLocation.storeName;
    NSString *city = currentClosestLocation.storeCity;
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:6];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = name;
    marker.snippet = city;
    marker.map = mapView;    
    

    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *lastLocation = [locations lastObject];
    
    GMSMarker *marker = [GMSMarker markerWithPosition:lastLocation.coordinate];
    self.mapView.myLocationEnabled = YES;
    marker.title = @"My Location";
    marker.map = self.mapView;
    
}



@end
