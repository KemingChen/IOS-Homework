#import "User.h"
#import "PrefixHeader.pch"

@interface User ()

- (void)assignDataWithIdentity:(NSInteger)identity name:(NSString*)name imageURL:(NSString*)imageURL;

@end

@implementation User

+ (User*)userWithIdentity:(NSInteger)identity name:(NSString*)name imageURL:(NSString*)imageURL
{
    User* user = nil;

    NSArray* users = [User MR_findByAttribute:@"identity" withValue:@(identity) inContext:[NSManagedObjectContext MR_defaultContext]];

    if (users.count > 0) {
        user = [users firstObject];
    }
    else {
        user = [User MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    }

    [user assignDataWithIdentity:identity name:name imageURL:imageURL];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

    return user;
}

- (void)assignDataWithIdentity:(NSInteger)identity name:(NSString*)name imageURL:(NSString*)imageURL
{
    self.identityValue = identity;
    self.imageURL = imageURL;
    self.name = name;
}

@end
