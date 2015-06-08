#import "_User.h"

@interface User : _User {}
+ (User*)userWithIdentity:(NSInteger)identity name:(NSString*)name imageURL:(NSString*)imageURL;
@end
