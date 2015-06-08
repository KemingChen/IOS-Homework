// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.h instead.

#import <CoreData/CoreData.h>

extern const struct CheckInAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *identity;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} CheckInAttributes;

extern const struct CheckInRelationships {
	__unsafe_unretained NSString *user;
} CheckInRelationships;

@class User;

@interface CheckInID : NSManagedObjectID {}
@end

@interface _CheckIn : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CheckInID* objectID;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* identity;

@property (atomic) int64_t identityValue;
- (int64_t)identityValue;
- (void)setIdentityValue:(int64_t)value_;

//- (BOOL)validateIdentity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageURL;

//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _CheckIn (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSNumber*)primitiveIdentity;
- (void)setPrimitiveIdentity:(NSNumber*)value;

- (int64_t)primitiveIdentityValue;
- (void)setPrimitiveIdentityValue:(int64_t)value_;

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
