//
//  MotionManager.h
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@class MotionManager;

@protocol MotionManagerDelegate <NSObject>

- (void)motionManager:(MotionManager *)motionManager didChangedAttitude:(CMAttitude *)attitude;

@end

@interface MotionManager : NSObject
{
    CMMotionManager *_motionManager;
    
    id<MotionManagerDelegate> _delegate;
}

+ (MotionManager *)sharedMotionMangaer;

- (void)startDetectMotionWithDelegate:(id<MotionManagerDelegate>)delegate;

- (void)stopDetectMotion;

@end
