//
//  BWJlr.h
//  Opwn Jewelry
//
//  Created by Siqi Wang on 13-2-3.
//  Copyright (c) 2013年 Bill Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BWJlr : NSObject
{
    NSMutableArray *mPoints;
    NSMutableArray *mConnections;
}

@property (nonatomic,strong) NSArray *connections;

-(id)initWithPoint:(CLLocation*)p;
-(void)addNewJlrPoint:(CLLocation*)p;
//-(void)deleteConnection:(NSUInteger)connection;

@end
