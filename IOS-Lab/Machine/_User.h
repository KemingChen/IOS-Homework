// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAttributes {
	__unsafe_unretained NSString *identity;
	__unsafe_unretained NSString *imagePhoto;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *isPhotoLocal;
	__unsafe_unretained NSString *name;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *checkIn;
} UserRelationships;

@class CheckIn;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID* objectID;

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

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *checkIn;

- (NSMutableSet*)checkInSet;

@end

@interface _User (CheckInCoreDataGeneratedAccessors)
- (void)addCheckIn:(NSSet*)value_;
- (void)removeCheckIn:(NSSet*)value_;
- (void)addCheckInObject:(CheckIn*)value_;
- (void)removeCheckInObject:(CheckIn*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

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

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveCheckIn;
- (void)setPrimitiveCheckIn:(NSMutableSet*)value;

@end
