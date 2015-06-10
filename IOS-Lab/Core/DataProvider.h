//
//  DataProvider.h
//  Week1_Test
//
//  Created by Charles@Bearsoft on 5/11/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataProvider : NSObject

+ (DataProvider*)sharedProvider;

- (NSMutableArray*)checkIns;

- (NSDate*)dateForSection:(NSInteger)section;

- (void)syncFromServer:(void (^)(bool success))complete;

@end
