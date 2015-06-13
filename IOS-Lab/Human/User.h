#import "_User.h"
#import <UIKit/UIKit.h>

@interface User : _User {
}
+ (User*)userWithIdentity:(NSInteger)identity name:(NSString*)name imageURL:(NSString*)imageURL;
+ (void)save;

- (void)assignUserImageURL:(NSString*)url;
- (void)assignUserImagePhoto:(UIImage*)photo;
- (void)displayPhoto:(UIImageView*)view;
@end
