//
//  DataProvider.m
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "DataProvider.h"
#import <AFNetworking.h>

@interface User ()

+ (User*)userWithIdentity:(NSInteger)identity name:(NSString*)name profileName:(NSString*)profileName;

@end

@implementation User

@synthesize identity = _identity;
@synthesize name = _name;
@synthesize profileName = _profileName;

+ (User*)userWithIdentity:(NSInteger)identity name:(NSString*)name profileName:(NSString*)profileName
{
    User* user = [[User alloc] init];

    [user assignDataWithIdentity:identity name:name profileName:profileName];

    return user;
}

- (void)assignDataWithIdentity:(NSInteger)identity name:(NSString*)name profileName:(NSString*)profileName
{
    _identity = identity;
    _profileName = profileName;
    _name = name;
}

@end

@interface CheckIn ()

+ (CheckIn*)checkInWithPoster:(User*)poster desc:(NSString*)desc imageName:(NSString*)imageName;

- (void)assignDataWithPoster:(User*)poster desc:(NSString*)desc imageName:(NSString*)imageName;

@end

@implementation CheckIn

+ (CheckIn*)checkInWithPoster:(User*)poster desc:(NSString*)desc imageName:(NSString*)imageName
{
    CheckIn* checkIn = [[CheckIn alloc] init];

    [checkIn assignDataWithPoster:poster desc:desc imageName:imageName];

    return checkIn;
}

@synthesize poster = _poster;
@synthesize checkInDesc = _checkInDesc;
@synthesize checkInImageName = _checkInImageName;

- (void)assignDataWithPoster:(User*)poster desc:(NSString*)desc imageName:(NSString*)imageName
{
    _poster = poster;
    _checkInDesc = desc;
    _checkInImageName = imageName;
}

@end

@implementation DataProvider

static NSMutableDictionary* users = nil;
static NSMutableArray* checkIns = nil;

+ (NSMutableArray*)checkIns
{
    return checkIns;
}

+ (NSDate*)dateForSection:(NSInteger)section
{
    return [NSDate dateWithTimeIntervalSinceNow:(section * 86400)];
}

+ (void)updateUsers:(NSArray*)userResponse
{
    users = [[NSMutableDictionary alloc] initWithCapacity:userResponse.count];
    for (NSDictionary* user in userResponse) {
        User* userObject = [User userWithIdentity:[user[@"id"] integerValue] name:user[@"name"] profileName:user[@"profile"]];
        [users setObject:userObject forKey:user[@"id"]];
    }
}

+ (void)updateCheckIns:(NSArray*)days
{
    checkIns = [[NSMutableArray alloc] initWithCapacity:days.count];
    for (NSArray* day in days) {
        NSMutableArray* dayObject = [NSMutableArray array];
        for (NSDictionary* checkIn in day) {
            User* user = users[checkIn[@"poster"]];
            CheckIn* checkInObject = [CheckIn checkInWithPoster:user desc:checkIn[@"desc"] imageName:checkIn[@"image"]];
            [dayObject addObject:checkInObject];
        }
        [checkIns addObject:dayObject];
    }
}

+ (void)syncFromServer:(void (^)(bool success))complete
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://140.124.182.88:3000/users" parameters:nil success:^(AFHTTPRequestOperation* operation, id responseObject) {
        [DataProvider updateUsers:responseObject];
        
        [manager GET:@"http://140.124.182.88:3000/checkIns" parameters:nil success:^(AFHTTPRequestOperation* operation, id responseObject) {
            [DataProvider updateCheckIns:responseObject];
            NSLog(@"finish");
            complete(YES);
            
        } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
            NSLog(@"Error: %@", error);
            complete(NO);
        }];
        
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
        NSLog(@"Error: %@", error);
        complete(NO);
    }];
}

@end
