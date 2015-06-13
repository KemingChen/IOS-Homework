#import "CheckIn.h"
#import "PrefixHeader.pch"
#import <UIImageView+AFNetworking.h>

@interface CheckIn ()

@end

@implementation CheckIn

+ (CheckIn*)checkInWithPoster:(NSInteger)identity user:(User*)user desc:(NSString*)desc imageURL:(NSString*)imageURL
{
    CheckIn* checkIn = nil;

    NSArray* checkIns = [CheckIn MR_findByAttribute:@"identity" withValue:@(identity) inContext:[NSManagedObjectContext MR_defaultContext]];

    if (checkIns.count > 0) {
        checkIn = [checkIns firstObject];
    }
    else {
        checkIn = [CheckIn MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    }

    checkIn.user = user;
    checkIn.desc = desc;
    checkIn.isPhotoLocalValue = false;
    checkIn.imageURL = imageURL;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

    return checkIn;
}

+ (CheckIn*)checkInWithMe:(NSInteger)identity desc:(NSString*)desc imagePhoto:(UIImage*)imagePhoto
{
    CheckIn* checkIn = nil;

    NSArray* checkIns = [CheckIn MR_findByAttribute:@"identity" withValue:@(identity) inContext:[NSManagedObjectContext MR_defaultContext]];

    if (checkIns.count > 0) {
        checkIn = [checkIns firstObject];
    }
    else {
        checkIn = [CheckIn MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    }

    checkIn.desc = desc;
    checkIn.isPhotoLocalValue = true;
    checkIn.imagePhoto = UIImagePNGRepresentation(imagePhoto);

    return checkIn;
}

+ (void)save
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)assignCheckInLocation:(double)longitude latitude:(double)latitude
{
    self.longitudeValue = longitude;
    self.latitudeValue = latitude;
}

- (void)displayPhoto:(UIImageView*)view
{
    if (self.isPhotoLocalValue) {
        [view setImage:[UIImage imageWithData:self.imagePhoto]];
    }
    else {
        [view setImageWithURL:[NSURL URLWithString:self.imageURL] placeholderImage:[UIImage imageNamed:@"day1_1"]];
    }
}

@end
