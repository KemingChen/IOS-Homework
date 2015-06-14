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
	.motionPitch = @"motionPitch",
	.motionRoll = @"motionRoll",
	.motionYaw = @"motionYaw",
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
	if ([key isEqualToString:@"motionPitchValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionPitch"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"motionRollValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionRoll"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"motionYawValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"motionYaw"];
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

@dynamic motionPitch;

- (double)motionPitchValue {
	NSNumber *result = [self motionPitch];
	return [result doubleValue];
}

- (void)setMotionPitchValue:(double)value_ {
	[self setMotionPitch:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionPitchValue {
	NSNumber *result = [self primitiveMotionPitch];
	return [result doubleValue];
}

- (void)setPrimitiveMotionPitchValue:(double)value_ {
	[self setPrimitiveMotionPitch:[NSNumber numberWithDouble:value_]];
}

@dynamic motionRoll;

- (double)motionRollValue {
	NSNumber *result = [self motionRoll];
	return [result doubleValue];
}

- (void)setMotionRollValue:(double)value_ {
	[self setMotionRoll:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionRollValue {
	NSNumber *result = [self primitiveMotionRoll];
	return [result doubleValue];
}

- (void)setPrimitiveMotionRollValue:(double)value_ {
	[self setPrimitiveMotionRoll:[NSNumber numberWithDouble:value_]];
}

@dynamic motionYaw;

- (double)motionYawValue {
	NSNumber *result = [self motionYaw];
	return [result doubleValue];
}

- (void)setMotionYawValue:(double)value_ {
	[self setMotionYaw:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMotionYawValue {
	NSNumber *result = [self primitiveMotionYaw];
	return [result doubleValue];
}

- (void)setPrimitiveMotionYawValue:(double)value_ {
	[self setPrimitiveMotionYaw:[NSNumber numberWithDouble:value_]];
}

@dynamic user;

@end

