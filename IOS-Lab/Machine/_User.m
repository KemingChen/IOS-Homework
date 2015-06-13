// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.identity = @"identity",
	.imagePhoto = @"imagePhoto",
	.imageURL = @"imageURL",
	.isPhotoLocal = @"isPhotoLocal",
	.name = @"name",
};

const struct UserRelationships UserRelationships = {
	.checkIn = @"checkIn",
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"identityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"identity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isPhotoLocalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isPhotoLocal"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic identity;

- (int64_t)identityValue {
	NSNumber *result = [self identity];
	return [result longLongValue];
}

- (void)setIdentityValue:(int64_t)value_ {
	[self setIdentity:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveIdentityValue {
	NSNumber *result = [self primitiveIdentity];
	return [result longLongValue];
}

- (void)setPrimitiveIdentityValue:(int64_t)value_ {
	[self setPrimitiveIdentity:[NSNumber numberWithLongLong:value_]];
}

@dynamic imagePhoto;

@dynamic imageURL;

@dynamic isPhotoLocal;

- (BOOL)isPhotoLocalValue {
	NSNumber *result = [self isPhotoLocal];
	return [result boolValue];
}

- (void)setIsPhotoLocalValue:(BOOL)value_ {
	[self setIsPhotoLocal:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsPhotoLocalValue {
	NSNumber *result = [self primitiveIsPhotoLocal];
	return [result boolValue];
}

- (void)setPrimitiveIsPhotoLocalValue:(BOOL)value_ {
	[self setPrimitiveIsPhotoLocal:[NSNumber numberWithBool:value_]];
}

@dynamic name;

@dynamic checkIn;

- (NSMutableSet*)checkInSet {
	[self willAccessValueForKey:@"checkIn"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"checkIn"];

	[self didAccessValueForKey:@"checkIn"];
	return result;
}

@end

