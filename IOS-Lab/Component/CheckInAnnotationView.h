//
//  CheckInAnnotationView.h
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "CheckIn.h"

@interface CheckInAnnotationView : MKPinAnnotationView

- (instancetype)initWithAnnotation:(CheckIn*)annotation;

@end
