//
//  MotionManager.m
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "MotionManager.h"

@implementation MotionManager

static MotionManager *_gSharedMotionManager = nil;

+ (MotionManager *)sharedMotionMangaer
{
    if (!_gSharedMotionManager)
    {
        _gSharedMotionManager = [[MotionManager alloc] init];
    }
    
    return _gSharedMotionManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _motionManager = [[CMMotionManager alloc] init];
    }
    
    return self;
}

- (void)startDetectMotionWithDelegate:(id<MotionManagerDelegate>)delegate
{
    _delegate = delegate;
    
    [_motionManager setDeviceMotionUpdateInterval:0.1f];
    [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error)
    {
        NSLog(@"Motion[%@]", motion);
        
        [_delegate motionManager:self didChangedAttitude:motion.attitude];
    }];
    
//    [_motionManager setGyroUpdateInterval:0.1f];
//    [_motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error)
//    {
//        NSLog(@"Gyro[%@]", gyroData);
//    }];
//    
//    
//    [_motionManager setAccelerometerUpdateInterval:0.1f];
//    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
//    {
//        NSLog(@"Accelerometer[%@]", accelerometerData);
//    }];
//    
//    [_motionManager setMagnetometerUpdateInterval:0.1f];
//    [_motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMagnetometerData *magnetometerData, NSError *error)
//    {
//        NSLog(@"Magnetometer[%@]", magnetometerData);
//    }];
}

- (void)stopDetectMotion
{
    [_motionManager stopDeviceMotionUpdates];
    
//    [_motionManager stopGyroUpdates];
//    
//    [_motionManager stopAccelerometerUpdates];
//    
//    [_motionManager stopMagnetometerUpdates];
}


@end
