#import "_CheckIn.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CheckIn : _CheckIn <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc;
+ (void)save;

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude;
- (void)assignCheckInImageURL:(NSString*)url;
- (void)assignCheckInImagePhoto:(UIImage*)photo;
- (void)assignCheckInMotion:(double)pitch roll:(double)roll yaw:(double)yaw;
- (void)displayPhoto:(UIImageView*)view;
@end
