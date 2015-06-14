// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.m instead.

#import "_CheckIn.h"

const struct CheckInAttributes CheckInAttributes = {
	.dayId = @"dayId",
	.desc = @"desc",
	.identity = @"identity",
	.imagePhoto = @"imagePhoto",
	.imageURL = @"imageURL",
	.isPhotoLocal = @"isPhotoLocal",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.motionX = @"motionX",
	.motionY = @"motionY",
	.motionZ = @"motionZ",
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

	if ([key isEqualToString:@"dayIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dayId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
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
	if ([key isEqualToString:@"motionXValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionX"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"motionYValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionY"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"motionZValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionZ"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic dayId;

- (int64_t)dayIdValue {
	NSNumber *result = [self dayId];
	return [result longLongValue];
}

- (void)setDayIdValue:(int64_t)value_ {
	[self setDayId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveDayIdValue {
	NSNumber *result = [self primitiveDayId];
	return [result longLongValue];
}

- (void)setPrimitiveDayIdValue:(int64_t)value_ {
	[self setPrimitiveDayId:[NSNumber numberWithLongLong:value_]];
}

@dynamic desc;

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

@dynamic motionX;

- (double)motionXValue {
	NSNumber *result = [self motionX];
	return [result doubleValue];
}

- (void)setMotionXValue:(double)value_ {
	[self setMotionX:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionXValue {
	NSNumber *result = [self primitiveMotionX];
	return [result doubleValue];
}

- (void)setPrimitiveMotionXValue:(double)value_ {
	[self setPrimitiveMotionX:[NSNumber numberWithDouble:value_]];
}

@dynamic motionY;

- (double)motionYValue {
	NSNumber *result = [self motionY];
	return [result doubleValue];
}

- (void)setMotionYValue:(double)value_ {
	[self setMotionY:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionYValue {
	NSNumber *result = [self primitiveMotionY];
	return [result doubleValue];
}

- (void)setPrimitiveMotionYValue:(double)value_ {
	[self setPrimitiveMotionY:[NSNumber numberWithDouble:value_]];
}

@dynamic motionZ;

- (double)motionZValue {
	NSNumber *result = [self motionZ];
	return [result doubleValue];
}

- (void)setMotionZValue:(double)value_ {
	[self setMotionZ:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionZValue {
	NSNumber *result = [self primitiveMotionZ];
	return [result doubleValue];
}

- (void)setPrimitiveMotionZValue:(double)value_ {
	[self setPrimitiveMotionZ:[NSNumber numberWithDouble:value_]];
}

@dynamic user;

@end

