// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.h instead.

#import <CoreData/CoreData.h>

extern const struct CheckInAttributes {
	__unsafe_unretained NSString *dayId;
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *identity;
	__unsafe_unretained NSString *imagePhoto;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *isPhotoLocal;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *motionX;
	__unsafe_unretained NSString *motionY;
	__unsafe_unretained NSString *motionZ;
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

@property (nonatomic, strong) NSNumber* dayId;

@property (atomic) int64_t dayIdValue;
- (int64_t)dayIdValue;
- (void)setDayIdValue:(int64_t)value_;

//- (BOOL)validateDayId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* identity;

@property (atomic) int64_t identityValue;
- (int64_t)identityValue;
- (void)setIdentityValue:(int64_t)value_;

//- (BOOL)validateIdentity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* imagePhoto;

//- (BOOL)validateImagePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageURL;

//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isPhotoLocal;

@property (atomic) BOOL isPhotoLocalValue;
- (BOOL)isPhotoLocalValue;
- (void)setIsPhotoLocalValue:(BOOL)value_;

//- (BOOL)validateIsPhotoLocal:(id*)value_ error:(NSError**)error_;

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

@property (nonatomic, strong) NSNumber* motionX;

@property (atomic) double motionXValue;
- (double)motionXValue;
- (void)setMotionXValue:(double)value_;

//- (BOOL)validateMotionX:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* motionY;

@property (atomic) double motionYValue;
- (double)motionYValue;
- (void)setMotionYValue:(double)value_;

//- (BOOL)validateMotionY:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* motionZ;

@property (atomic) double motionZValue;
- (double)motionZValue;
- (void)setMotionZValue:(double)value_;

//- (BOOL)validateMotionZ:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _CheckIn (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveDayId;
- (void)setPrimitiveDayId:(NSNumber*)value;

- (int64_t)primitiveDayIdValue;
- (void)setPrimitiveDayIdValue:(int64_t)value_;

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSNumber*)primitiveIdentity;
- (void)setPrimitiveIdentity:(NSNumber*)value;

- (int64_t)primitiveIdentityValue;
- (void)setPrimitiveIdentityValue:(int64_t)value_;

- (NSData*)primitiveImagePhoto;
- (void)setPrimitiveImagePhoto:(NSData*)value;

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (NSNumber*)primitiveIsPhotoLocal;
- (void)setPrimitiveIsPhotoLocal:(NSNumber*)value;

- (BOOL)primitiveIsPhotoLocalValue;
- (void)setPrimitiveIsPhotoLocalValue:(BOOL)value_;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (NSNumber*)primitiveMotionX;
- (void)setPrimitiveMotionX:(NSNumber*)value;

- (double)primitiveMotionXValue;
- (void)setPrimitiveMotionXValue:(double)value_;

- (NSNumber*)primitiveMotionY;
- (void)setPrimitiveMotionY:(NSNumber*)value;

- (double)primitiveMotionYValue;
- (void)setPrimitiveMotionYValue:(double)value_;

- (NSNumber*)primitiveMotionZ;
- (void)setPrimitiveMotionZ:(NSNumber*)value;

- (double)primitiveMotionZValue;
- (void)setPrimitiveMotionZValue:(double)value_;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
