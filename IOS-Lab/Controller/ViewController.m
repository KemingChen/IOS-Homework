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
#import "ChekcInCollectionViewCell.h"
#import "CheckIn.h"
#import "User.h"
#import "CheckInAnnotationView.h"

@interface ViewController () {
    NSMutableArray* checkIns;
    DataProvider* dateProvider;
}

@end

@implementation ViewController

bool isOpenSlideMenu = false;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[DataProvider sharedProvider] syncFromServer:^(bool success) {
        [self syncDataComplete:success];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChangeNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)syncDataComplete:(bool)success
{
    if (success) {
        checkIns = [[DataProvider sharedProvider] checkIns];
        [self.tableView reloadData];
        [self.collectionView reloadData];
        [self updateMapViewAnnotation];
    }
}

- (void)updateMapViewAnnotation
{
    // Clean All Annotations
    NSMutableArray* annotationsToRemove = [self.mapView.annotations mutableCopy];
    [self.mapView removeAnnotations:annotationsToRemove];

    // Add All CheckInAnnotations
    for (NSArray* day in checkIns) {
        [self.mapView addAnnotations:day];
    }
}

- (void)deviceOrientationDidChangeNotification:(NSNotification*)note
{
    [self.tableView reloadData];
    [self.collectionView reloadData];

    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    switch (orientation) {
    case UIDeviceOrientationPortrait:
        self.tableView.hidden = false;
        self.slideMenuButton.hidden = false;
        self.mapView.hidden = false;
        self.headerTitle.hidden = false;
        break;

    case UIDeviceOrientationLandscapeLeft:
    case UIDeviceOrientationLandscapeRight:
        self.tableView.hidden = true;
        self.slideMenuButton.hidden = true;
        self.mapView.hidden = true;
        self.headerTitle.hidden = true;
        if (isOpenSlideMenu) {
            [self closeOrOpenSlideMenu];
        }
        break;

    default:
        break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeOrOpenSlideMenu
{
    double newWidth = self.view.frame.size.width - 80.0f;

    if (isOpenSlideMenu)
        newWidth = 0.0f;
    isOpenSlideMenu = !isOpenSlideMenu;

    self.leftOffsetConstrain.constant = newWidth;
    [self.view layoutIfNeeded];
}

- (void)clickSlideMenuButton:(id)sender
{
    self.slideMenuButtonWidth.constant = self.view.frame.size.width - 80.0f;
    [UIView animateWithDuration:0.25
                     animations:^{
                         [self closeOrOpenSlideMenu];
                     }];
}

#pragma mark - Click Tabs
- (IBAction)clickTableViewButton:(id)sender
{
    [self.parentView bringSubviewToFront:self.tableView];
    [self clickSlideMenuButton:nil];
}

- (IBAction)clickCollectionViewButton:(id)sender
{
    [self.collectionView reloadData];
    [self.parentView bringSubviewToFront:self.collectionView];
    [self clickSlideMenuButton:nil];
}

- (IBAction)clickMapViewButton:(id)sender
{
    [self fitMap:self.mapView];
    [self.parentView bringSubviewToFront:self.mapView];
    [self clickSlideMenuButton:nil];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return checkIns.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* days = checkIns[section];
    return days.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentitier = @"CheckInCell";
    CheckInTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentitier forIndexPath:indexPath];

    assert([cell isKindOfClass:[CheckInTableViewCell class]]);

    NSArray* day = checkIns[indexPath.section];
    CheckIn* checkIn = day[indexPath.row];
    [cell setCheckIn:checkIn];

    return cell;
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];

    NSString* stringFromDate = [formatter stringFromDate:[[DataProvider sharedProvider] dateForSection:section]];
    NSArray* day = checkIns[section];

    return [NSString stringWithFormat:@"%@ , 共 %lu 個", stringFromDate, (unsigned long)day.count];
}

#pragma mark - Table View Delegate
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static CheckInTableViewCell* cell = nil;

    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CheckInCell"];
    }

    [cell setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];

    NSArray* day = checkIns[indexPath.section];
    CheckIn* checkIn = day[indexPath.row];
    [cell setCheckIn:checkIn];

    [cell layoutIfNeeded];
    [tableView layoutIfNeeded];
    return cell.checkInImageView.frame.origin.y + cell.checkInImageView.frame.size.height;
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSMutableArray* day = checkIns[indexPath.section];

    if (day.count > 1) {
        [day removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        [checkIns removeObjectAtIndex:indexPath.section];
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];

        [self.collectionView reloadData];
    }
}

#pragma mark - CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [checkIns[section] count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentitier = @"CheckInCell";

    ChekcInCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentitier forIndexPath:indexPath];

    assert([cell isKindOfClass:[ChekcInCollectionViewCell class]]);

    NSArray* day = checkIns[indexPath.section];
    CheckIn* checkIn = day[indexPath.row];
    [cell setCheckIn:checkIn];

    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return checkIns.count;
}

#pragma mark - CollectionView Delegates
- (void)collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    NSArray* day = checkIns[indexPath.section];
    CheckIn* checkIn = day[indexPath.row];
    User* user = checkIn.user;

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:user.name message:checkIn.desc delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

    [alert show];
}

#pragma mark - MKMapView Delegates
- (MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[CheckIn class]]) {
        CheckInAnnotationView* annotationView = [[CheckInAnnotationView alloc] initWithAnnotation:annotation];
        return annotationView;
    }
    else {
        return nil;
    }
}

- (void)mapView:(MKMapView*)mapView didAddAnnotationViews:(NSArray*)views
{
}

- (void)fitMap:(MKMapView*)mapView;
{
    if (mapView.annotations.count > 0) {
        MKMapRect zoomRect = MKMapRectNull;
        for (id<MKAnnotation> annotation in mapView.annotations) {
            MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
            MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 400, 400);

            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }

        MKCoordinateRegion region = MKCoordinateRegionForMapRect(zoomRect);

        //add padding so pins aren't scrunched on the edges
        region.span.latitudeDelta *= 1.2f;
        region.span.longitudeDelta *= 1.2f;

        [mapView setRegion:region animated:YES];
    }
}
@end
