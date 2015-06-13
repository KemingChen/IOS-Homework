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

NSInteger postCheckInIdentity = 100;

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
    NSArray* array = [NSMutableArray arrayWithArray:[CheckIn MR_findAllInContext:[NSManagedObjectContext MR_defaultContext]]];
    NSMutableDictionary* days = [[NSMutableDictionary alloc] init];
    checkIns = [NSMutableArray array];
    for (CheckIn* checkIn in array) {
        long long groupId = checkIn.groupIdValue;
        if (![days objectForKey:@(groupId)]) {
            NSMutableArray* day = [NSMutableArray array];
            [checkIns addObject:day];
            [days setObject:day forKey:@(groupId)];
        }
        NSMutableArray* temp = days[@(groupId)];
        [temp addObject:checkIn];

        if (checkIn.identityValue > postCheckInIdentity) {
            postCheckInIdentity = checkIn.identityValue;
        }
    }

    iUser = [User userWithIdentity:-1 name:@"我"];
    [iUser assignUserImagePhoto:[UIImage imageNamed:@"no_photo"]];

    return self;
}

- (void)postCheckInToDataProvider:(UIImage*)photo desc:(NSString*)desc location:(CLLocationCoordinate2D)location
{
    CheckIn* checkIn = [CheckIn checkInWithPoster:postCheckInIdentity user:iUser desc:desc];
    [checkIn assignCheckInImagePhoto:photo];
    [checkIn assignCheckInLocation:location.longitude latitude:location.latitude];
    [checkIns[0] addObject:checkIn];
    [CheckIn save];
}

- (NSMutableArray*)checkIns
{
    return checkIns;
}

- (NSDate*)dateForSection:(NSInteger)section
{
    return [NSDate dateWithTimeIntervalSinceNow:(section * 86400)];
}

- (void)updateUsers:(NSArray*)userResponse
{
    users = [[NSMutableDictionary alloc] init];
    for (NSDictionary* user in userResponse) {
        User* userObject = [User userWithIdentity:[user[@"id"] integerValue] name:user[@"name"]];
        [userObject assignUserImageURL:user[@"profile"]];
        [users setObject:userObject forKey:user[@"id"]];
    }
    [User save];
}

- (void)updateCheckIns:(NSArray*)days
{
    checkIns = [[NSMutableArray alloc] init];

    int groupId = 0;
    for (NSArray* day in days) {
        NSMutableArray* dayObject = [NSMutableArray array];

        groupId++;

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
            checkInObject.groupIdValue = groupId;
            [dayObject addObject:checkInObject];
        }

        [checkIns addObject:dayObject];
    }
    [CheckIn save];
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
                    NSLog(@"update finish");
                    complete(YES);

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
