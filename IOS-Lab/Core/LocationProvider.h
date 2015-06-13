//
//  LocationProvider.h
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@class LocationProvider;

@protocol LocationProviderDelegate <NSObject>

- (void)locationProvider:(LocationProvider *)provider provideCurrentLocation:(CLLocation *)location;

@end

@interface LocationProvider : NSObject<CLLocationManagerDelegate>

+ (LocationProvider *)sharedProvider;

- (void)requestCurrentLocationWithDelegate:(id<LocationProviderDelegate>)delegate;

@end
