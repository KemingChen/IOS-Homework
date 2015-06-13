//
//  DataProvider.h
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationProvider.h"

@interface DataProvider : NSObject

+ (DataProvider*)sharedProvider;

- (void)postCheckInToDataProvider:(UIImage*)photo desc:(NSString*)desc location:(CLLocationCoordinate2D)location;

- (NSMutableArray*)checkIns;

- (NSDate*)dateForSection:(NSInteger)section;

- (void)syncFromServer:(void (^)(bool success))complete;

@end
