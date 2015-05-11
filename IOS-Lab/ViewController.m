//
//  ViewController.m
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "ViewController.h"
#import "DataProvider.h"
#import "CheckInTableViewCell.h"

@interface ViewController () {
    NSArray* checkIns;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    checkIns = [DataProvider checkIns];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataProvider
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return checkIns.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* days = checkIns[section];
    return days.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentitier = @"CheckInCell";
    CheckInTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentitier forIndexPath:indexPath];

    assert([cell isKindOfClass:[CheckInTableViewCell class]]);

    NSArray* day = checkIns[indexPath.section];
    CheckIn* checkIn = day[indexPath.row];
    User* user = checkIn.poster;

    [cell.userNameView setText:user.name];

    [cell.userImageView setImage:[UIImage imageNamed:user.profileName]];
    cell.userImageView.layer.cornerRadius = 40.0;
    cell.userImageView.clipsToBounds = YES;

    [cell.checkInDesView setText:checkIn.checkInDesc];

    [cell.checkInImageView setImage:[UIImage imageNamed:checkIn.checkInImageName]];

    return cell;
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];

    NSString* stringFromDate = [formatter stringFromDate:[DataProvider dateForSection:section]];
    NSArray* day = checkIns[section];

    return [NSString stringWithFormat:@"%@ , 共 %lu 個", stringFromDate, day.count];
}

#pragma mark - Table View Delegate
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 294.0;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
//    NSArray* day = checkIns[indexPath.section];
//    CheckIn* checkIn = day[indexPath.row];
//    User* user = checkIn.poster;
//
//    UIAlertView* alert = [[UIAlertView alloc] initWithTitle : user.name message : checkIn.checkInDesc delegate : nil cancelButtonTitle : @"OK" otherButtonTitles : nil, nil];
//    
//    [alert show];
}
@end
