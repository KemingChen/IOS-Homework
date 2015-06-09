#import "_CheckIn.h"

@interface CheckIn : _CheckIn {}
+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc imageURL:(NSString*)imageURL;

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude;
@end
