//
//  LocationProvider.m
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "LocationProvider.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationProvider()
{
    CLLocationManager *_locationManager;
    
    id<LocationProviderDelegate> _delegate;
}

@end


@implementation LocationProvider

static LocationProvider *_gSharedLocationProvider = nil;

+ (LocationProvider *)sharedProvider
{
    if (!_gSharedLocationProvider)
    {
        _gSharedLocationProvider = [[LocationProvider alloc] init];
    }
    
    return _gSharedLocationProvider;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _locationManager = [[CLLocationManager alloc] init];
        
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        _locationManager.delegate = self;
        
        if ([CLLocationManager locationServicesEnabled] &&
            [_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
    return self;
}

- (void)requestCurrentLocationWithDelegate:(id<LocationProviderDelegate>)delegate
{
    _delegate = delegate;
    
    [_locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (_delegate)
    {
        [_delegate locationProvider:self provideCurrentLocation:[locations firstObject]];
    }
}

@end
