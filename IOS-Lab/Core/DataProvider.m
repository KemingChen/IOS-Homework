//
//  DataProvider.m
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "DataProvider.h"
#import <AFNetworking.h>
#import "User.h"
#import "CheckIn.h"
#import "PrefixHeader.pch"

@implementation DataProvider

typedef void (^FinishCallback)(bool success);

static DataProvider* dataProvider = nil;

int postCheckInIdentity = 1000;

User* iUser = nil;
NSMutableDictionary* users = nil;
NSMutableArray* checkIns = nil;
FinishCallback callback = nil;

+ (DataProvider*)sharedProvider
{
    if (dataProvider == nil) {
        dataProvider = [[DataProvider alloc] init];
    }
    return dataProvider;
}

- (DataProvider*)init
{
    [self loadLocalCheckIns];

    iUser = [User userWithIdentity:-1 name:@"KemingChen"];
    [iUser assignUserImagePhoto:[UIImage imageNamed:@"KemingChen"]];

    return self;
}

- (void)loadLocalCheckIns
{
    checkIns = [[NSMutableArray alloc] init];
    users = [[NSMutableDictionary alloc] init];

    NSArray* array = [NSMutableArray arrayWithArray:[CheckIn MR_findAllSortedBy:@"identity" ascending:false inContext:[NSManagedObjectContext MR_defaultContext]]];
    NSMutableDictionary* days = [[NSMutableDictionary alloc] init];
    checkIns = [NSMutableArray array];
    for (CheckIn* checkIn in array) {
        long long dayId = checkIn.dayIdValue;
        if (![days objectForKey:@(dayId)]) {
            NSMutableArray* day = [NSMutableArray array];
            [checkIns addObject:day];
            [days setObject:day forKey:@(dayId)];
        }
        NSMutableArray* temp = days[@(dayId)];
        [temp addObject:checkIn];

        if (checkIn.identityValue >= postCheckInIdentity) {
            postCheckInIdentity = [checkIn.identity integerValue];
        }
    }
}
- (void)postCheckInToDataProvider:(UIImage*)photo desc:(NSString*)desc location:(CLLocationCoordinate2D)location motion:(CMAttitude*)motion
{
    postCheckInIdentity++;
    CheckIn* checkIn = [CheckIn checkInWithPoster:postCheckInIdentity user:iUser desc:desc];
    [checkIn assignCheckInImagePhoto:photo];
    [checkIn assignCheckInLocation:location.longitude latitude:location.latitude];
    [checkIn assignCheckInMotion:motion.pitch roll:motion.roll yaw:motion.yaw];
    [checkIns[0] insertObject:checkIn atIndex:0];
    checkIn.dayIdValue = [checkIns count] - 1;
    [CheckIn save];

    callback(YES);
}

- (NSMutableArray*)checkIns
{
    return checkIns;
}

- (NSDate*)dateForSection:(NSInteger)section
{
    return [NSDate dateWithTimeIntervalSinceNow:(([checkIns count] - 1 - section) * 86400)];
}

- (void)updateUsers:(NSArray*)userResponse
{
    for (NSDictionary* user in userResponse) {
        User* userObject = [User userWithIdentity:[user[@"id"] integerValue] name:user[@"name"]];
        [userObject assignUserImageURL:user[@"profile"]];
        [users setObject:userObject forKey:user[@"id"]];
    }
    [User save];
}

- (void)updateCheckIns:(NSArray*)days
{
    int dayId = 0;
    for (NSArray* day in days) {
        for (NSDictionary* checkIn in day) {
            User* user = users[checkIn[@"poster"]];
            CheckIn* checkInObject = [CheckIn checkInWithPoster:[checkIn[@"id"] integerValue] user:user desc:checkIn[@"desc"]];

            // update CheckIn Image
            [checkInObject assignCheckInImageURL:checkIn[@"image"]];

            // update CheckIn Location
            double longitude = [checkIn[@"location"][@"longitude"] doubleValue];
            double latitude = [checkIn[@"location"][@"latitude"] doubleValue];
            [checkInObject assignCheckInLocation:longitude latitude:latitude];

            // add CheckIn Object to List
            checkInObject.dayIdValue = dayId;
        }

        dayId++;
    }
    [CheckIn save];

    [self loadLocalCheckIns];
    if (callback != nil) {
        callback(YES);
    }
}

- (void)syncFromServer:(FinishCallback)complete
{
    callback = complete;

    complete(YES);

    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://140.124.182.88:3000/users"
        parameters:nil
        success:^(AFHTTPRequestOperation* operation, id responseObject) {
            [self updateUsers:responseObject];

            [manager GET:@"http://140.124.182.88:3000/checkIns"
                parameters:nil
                success:^(AFHTTPRequestOperation* operation, id responseObject) {
                    [self updateCheckIns:responseObject];

                }
                failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                    NSLog(@"Error: %@", error);
                    complete(NO);
                }];

        }
        failure:^(AFHTTPRequestOperation* operation, NSError* error) {
            NSLog(@"Error: %@", error);
            complete(NO);
        }];
}

@end
