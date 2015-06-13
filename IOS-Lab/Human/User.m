#import "User.h"
#import "PrefixHeader.pch"
#import <UIImageView+AFNetworking.h>

@interface User ()
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

    user.identityValue = identity;
    user.imageURL = imageURL;
    user.name = name;

    return user;
}

+ (void)save
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)assignUserImageURL:(NSString*)url
{
    self.isPhotoLocalValue = false;
    self.imageURL = url;
}

- (void)assignUserImagePhoto:(UIImage*)photo
{
    self.isPhotoLocalValue = true;
    self.imagePhoto = UIImagePNGRepresentation(photo);
}

- (void)displayPhoto:(UIImageView*)view
{
    view.layer.cornerRadius = 40.0;
    view.clipsToBounds = YES;
    if (self.isPhotoLocalValue) {
        [view setImage:[UIImage imageWithData:self.imagePhoto]];
    }
    else {
        [view setImageWithURL:[NSURL URLWithString:self.imageURL] placeholderImage:[UIImage imageNamed:@"brand"]];
    }
}

@end
