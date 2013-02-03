//
//  BWNewJlrViewController.m
//  Opwn Jewelry
//
//  Created by Siqi Wang on 13-2-3.
//  Copyright (c) 2013年 Bill Wang. All rights reserved.
//

#import "BWNewJlrViewController.h"

@interface BWNewJlrViewController ()

@end

@implementation BWNewJlrViewController
@synthesize theMap, addButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self startLocationServices:YES];
    [theMap setDelegate:self];
    [self restart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (!jlr) {
        [self restart];
        
    }
    else
    {
        [addButton setEnabled:YES];
        [lManager setDistanceFilter:100];

    }

}

- (BOOL)startLocationServices:(BOOL)ignorePrefs
{
    //
    //    /*UNREVISEDCOMMENTS*/
    //
    if (lManager == nil)
    {
        if ([CLLocationManager locationServicesEnabled] || ignorePrefs)
        {
            lManager    =    [[CLLocationManager alloc] init];
            [lManager setDelegate:self];
            [lManager setDesiredAccuracy:kCLLocationAccuracyBest];
            [lManager setDistanceFilter:1000.0];
        }
        else
        {
            return NO;
        }
    }
   //can use this when developed [lManager startMonitoringSignificantLocationChanges];
    [lManager startUpdatingLocation];
    return YES;
}


- (IBAction)addButton:(id)sender {
    [jlr addNewJlrPoint:lManager.location];
    [self drawLines];
    [addButton setEnabled:NO];

}

-(void)drawLines
{
    NSArray *c = jlr.connections;
    for (NSArray *connection in c) {
    
        CLLocation *theP = [connection objectAtIndex:0];
        CLLocation *coor = [connection objectAtIndex:1];
        
        CLLocationCoordinate2D polylineCoorStruct[2];

        polylineCoorStruct[0] = theP.coordinate;
        polylineCoorStruct[1] = coor.coordinate;
        
        MKPolyline *polyline = [MKPolyline polylineWithCoordinates:polylineCoorStruct count:2];
        theLine = polyline;
        [theMap addOverlay:polyline];
    }
    [theMap setNeedsDisplay];

}


-(MKOverlayView*)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineView* lineView = [[MKPolylineView alloc] initWithPolyline:theLine];
    lineView.fillColor = [UIColor whiteColor];
    lineView.strokeColor = [UIColor blackColor];
    lineView.lineWidth = 6;
    [lineView setAlpha:1.0];
    return lineView;
}



























- (IBAction)clearAll:(id)sender {
    [self restart];
    theMap remove
}



-(void)restart
{
    jlr = [[BWJlr alloc] initWithPoint:lManager.location];
    [addButton setEnabled:NO];
}







@end
