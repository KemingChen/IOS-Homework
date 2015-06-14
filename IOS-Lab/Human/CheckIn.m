#import "CheckIn.h"
#import "PrefixHeader.pch"
#import <UIImageView+AFNetworking.h>

@interface CheckIn ()

@end

@implementation CheckIn

+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc
{
    CheckIn* checkIn = nil;

    NSArray* checkIns = [CheckIn MR_findByAttribute:@"identity" withValue:@(identity) inContext:[NSManagedObjectContext MR_defaultContext]];

    if (checkIns.count > 0) {
        checkIn = [checkIns firstObject];
    }
    else {
        checkIn = [CheckIn MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    }

    checkIn.identityValue = identity;
    checkIn.user = user;
    checkIn.desc = desc;

    return checkIn;
}

+ (void)save
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(self.latitudeValue, self.longitudeValue);
}

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude
{
    self.longitudeValue = longitude;
    self.latitudeValue = latitude;
}

- (void)assignCheckInMotion:(double)pitch roll:(double)roll yaw:(double)yaw
{
    self.motionPitchValue = pitch;
    self.motionRollValue = roll;
    self.motionYawValue = yaw;
}

- (void)assignCheckInImageURL:(NSString*)url
{
    self.isPhotoLocalValue = false;
    self.imageURL = url;
}

- (void)assignCheckInImagePhoto:(UIImage*)photo
{
    self.isPhotoLocalValue = true;
    self.imagePhoto = UIImagePNGRepresentation(photo);
}

- (void)displayPhoto:(UIImageView*)view
{
    if (self.isPhotoLocalValue) {
        [view setImage:[UIImage imageWithData:self.imagePhoto]];
    }
    else {
        [view setImageWithURL:[NSURL URLWithString:self.imageURL] placeholderImage:[UIImage imageNamed:@"loading"]];
    }
}

@end
