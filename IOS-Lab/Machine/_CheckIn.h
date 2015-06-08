// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.h instead.

#import <CoreData/CoreData.h>

extern const struct CheckInAttributes {
    __unsafe_unretained NSString* desc;
    __unsafe_unretained NSString* imageURL;
} CheckInAttributes;

extern const struct CheckInRelationships {
    __unsafe_unretained NSString* user;
} CheckInRelationships;

@class User;

@interface CheckInID : NSManagedObjectID {
}
@end

@interface _CheckIn : NSManagedObject {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CheckInID* objectID;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageURL;

//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) User* user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _CheckIn (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
