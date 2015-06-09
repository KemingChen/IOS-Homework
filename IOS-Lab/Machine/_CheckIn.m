// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.m instead.

#import "_CheckIn.h"

const struct CheckInAttributes CheckInAttributes = {
	.desc = @"desc",
	.groupId = @"groupId",
	.identity = @"identity",
	.imageURL = @"imageURL",
	.latitude = @"latitude",
	.longitude = @"longitude",
};

const struct CheckInRelationships CheckInRelationships = {
	.user = @"user",
};

@implementation CheckInID
@end

@implementation _CheckIn

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CheckIn" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CheckIn";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CheckIn" inManagedObjectContext:moc_];
}

- (CheckInID*)objectID {
	return (CheckInID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"groupIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"groupId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"identityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"identity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic desc;

@dynamic groupId;

- (int64_t)groupIdValue {
	NSNumber *result = [self groupId];
	return [result longLongValue];
}

- (void)setGroupIdValue:(int64_t)value_ {
	[self setGroupId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveGroupIdValue {
	NSNumber *result = [self primitiveGroupId];
	return [result longLongValue];
}

- (void)setPrimitiveGroupIdValue:(int64_t)value_ {
	[self setPrimitiveGroupId:[NSNumber numberWithLongLong:value_]];
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

@dynamic imageURL;

@dynamic latitude;

- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}

@dynamic longitude;

- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}

@dynamic user;

@end

