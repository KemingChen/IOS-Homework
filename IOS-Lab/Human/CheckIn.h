#import "_CheckIn.h"
#import <UIKit/UIKit.h>

@interface CheckIn : _CheckIn {
}
+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc;
+ (void)save;

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude;
- (void)assignCheckInImageURL:(NSString*)url;
- (void)assignCheckInImagePhoto:(UIImage*)photo;
- (void)displayPhoto:(UIImageView*)view;
@end
