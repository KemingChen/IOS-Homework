//
//  DataProvider.h
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface User : NSObject
//
//@property (nonatomic, readonly) NSString* name;
//
//@property (nonatomic, readonly) NSString* profileName;
//
//@property (nonatomic, readonly) NSInteger identity;
//
//@end
//
//@interface CheckIn : NSObject
//
//@property (nonatomic, readonly) User* poster;
//
//@property (nonatomic, readonly) NSString* checkInDesc;
//
//@property (nonatomic, readonly) NSString* checkInImageName;
//
//@end

@interface DataProvider : NSObject

+ (NSMutableArray*)checkIns;

+ (NSDate*)dateForSection:(NSInteger)section;

+ (void)syncFromServer:(void (^)(bool success))complete;

@end
