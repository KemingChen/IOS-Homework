#import "_CheckIn.h"
#import <UIKit/UIKit.h>

@interface CheckIn : _CheckIn {
}
+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc imageURL:(NSString*)imageURL;
+ (void)save;

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude;
- (void)displayPhoto:(UIImageView*)view;
@end
