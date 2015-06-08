// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CheckIn.m instead.

#import "_CheckIn.h"

const struct CheckInAttributes CheckInAttributes = {
    .desc = @"desc",
    .imageURL = @"imageURL",
};

const struct CheckInRelationships CheckInRelationships = {
    .user = @"user",
};

@implementation CheckInID
@end

@implementation _CheckIn

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_
{
    NSParameterAssert(moc_);
    return [NSEntityDescription insertNewObjectForEntityForName:@"CheckIn" inManagedObjectContext:moc_];
}

+ (NSString*)entityName
{
    return @"CheckIn";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_
{
    NSParameterAssert(moc_);
    return [NSEntityDescription entityForName:@"CheckIn" inManagedObjectContext:moc_];
}

- (CheckInID*)objectID
{
    return (CheckInID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key
{
    NSSet* keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

    return keyPaths;
}

@dynamic desc;

@dynamic imageURL;

@dynamic user;

@end
