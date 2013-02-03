//
//  BWNewJlrViewController.h
//  Opwn Jewelry
//
//  Created by Siqi Wang on 13-2-3.
//  Copyright (c) 2013年 Bill Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BWJlr.h"

@interface BWNewJlrViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>
{
    BWJlr *jlr;
    CLLocationManager *lManager;
    MKPolyline *theLine;
}
@property (weak, nonatomic) IBOutlet MKMapView *theMap;
- (IBAction)addButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
- (IBAction)clearAll:(id)sender;

@end
