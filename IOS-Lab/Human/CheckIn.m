#import "CheckIn.h"
#import "PrefixHeader.pch"

@interface CheckIn ()

- (void)assignDataWithPoster:(User*)user desc:(NSString*)desc imageURL:(NSString*)imageURL;

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

    [checkIn assignDataWithPoster:user desc:desc imageURL:imageURL];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

    return checkIn;
}

- (void)assignDataWithPoster:(User*)user desc:(NSString*)desc imageURL:(NSString*)imageURL
{
    NSLog(@"Assign CheckIn!!!");
    NSLog(@"%@", user);
    NSLog(@"%@", desc);
    NSLog(@"%@", imageURL);
    NSLog(@"#########################");
    self.user = user;
    self.desc = desc;
    self.imageURL = imageURL;
}

@end
