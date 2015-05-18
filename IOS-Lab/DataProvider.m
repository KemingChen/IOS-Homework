//
//  DataProvider.m
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "DataProvider.h"

@interface User()

+ (User *)userWithIdentity:(NSInteger)identity name:(NSString *)name profileName:(NSString *)profileName;

@end


@implementation User

@synthesize identity = _identity;
@synthesize name = _name;
@synthesize profileName = _profileName;

+ (User *)userWithIdentity:(NSInteger)identity name:(NSString *)name profileName:(NSString *)profileName
{
    User *user = [[User alloc] init];
    
    [user assignDataWithIdentity:identity name:name profileName:profileName];
    
    return user;
}

- (void)assignDataWithIdentity:(NSInteger)identity name:(NSString *)name profileName:(NSString *)profileName
{
    _identity = identity;
    _profileName = profileName;
    _name = name;
}

@end


@interface CheckIn()

+ (CheckIn *)checkInWithPoster:(User *)poster desc:(NSString *)desc imageName:(NSString *)imageName;

- (void)assignDataWithPoster:(User *)poster desc:(NSString *)desc imageName:(NSString *)imageName;

@end

@implementation CheckIn

+ (CheckIn *)checkInWithPoster:(User *)poster desc:(NSString *)desc imageName:(NSString *)imageName
{
    CheckIn *checkIn = [[CheckIn alloc] init];
    
    [checkIn assignDataWithPoster:poster desc:desc imageName:imageName];
    
    return checkIn;
}


@synthesize poster = _poster;
@synthesize checkInDesc = _checkInDesc;
@synthesize checkInImageName = _checkInImageName;

- (void)assignDataWithPoster:(User *)poster desc:(NSString *)desc imageName:(NSString *)imageName
{
    _poster = poster;
    _checkInDesc = desc;
    _checkInImageName = imageName;
}

@end


@implementation DataProvider

static NSArray *_gCheckIns = nil;

+ (NSArray *)checkIns
{
    [self setup];
    
    return _gCheckIns;
}

+ (NSDate *)dateForSection:(NSInteger)section
{
    [self setup];
    
    return [NSDate dateWithTimeIntervalSinceNow:(section * 86400)];
}

+ (void)setup
{
    if (_gCheckIns == nil)
    {
        User *cooper = [User userWithIdentity:0 name:@"Joseph Cooper" profileName:@"cooper.jpg"];
        
        User *brand = [User userWithIdentity:1 name:@"Amelia Brand" profileName:@"brand.jpg"];
        
        User *mann = [User userWithIdentity:1 name:@"Mann" profileName:@"mann.jpg"];
        
        //Day 1
        NSMutableArray *day1 = [NSMutableArray array];
        
        [day1 addObject:[CheckIn checkInWithPoster:cooper desc:@"我女兒問我為什麼要用一個蠢定律的名字為她命名？" imageName:@"day1_1.jpg"]];
        
        [day1 addObject:[CheckIn checkInWithPoster:cooper desc:@"書都掉下來...我嚇傻了！" imageName:@"day1_2.jpg"]];
        
        [day1 addObject:[CheckIn checkInWithPoster:brand desc:@"又聽到一個重力事件，未來生物一定存在!!" imageName:@"day1_3.jpg"]];
        
        //Day 2
        NSMutableArray *day2 = [NSMutableArray array];
        
        [day2 addObject:[CheckIn checkInWithPoster:mann desc:@"我知道很壯觀，不過可以快點來找我嗎?" imageName:@"day2_3.jpg"]];
        
        [day2 addObject:[CheckIn checkInWithPoster:cooper desc:@"各位...那不是山...是浪啊............Orz" imageName:@"day2_2.jpg"]];
        
        [day2 addObject:[CheckIn checkInWithPoster:brand desc:@"你以為我沒有在算時間嗎!!!!!!(崩潰)" imageName:@"day2_1.jpg"]];

        
        //Day 3
        NSMutableArray *day3 = [NSMutableArray array];
        [day3 addObject:[CheckIn checkInWithPoster:mann desc:@"我終於快出場了..." imageName:@"day3_1.jpg"]];
        [day3 addObject:[CheckIn checkInWithPoster:brand desc:@"不敢相信我爸爸竟然...走了..." imageName:@"day3_2.jpg"]];
        
        
        
        
        _gCheckIns = [NSArray arrayWithObjects:day1, day2, day3, nil];
    }
}

@end
