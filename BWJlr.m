//
//  BWJlr.m
//  Opwn Jewelry
//
//  Created by Siqi Wang on 13-2-3.
//  Copyright (c) 2013年 Bill Wang. All rights reserved.
//

#import "BWJlr.h"

@implementation BWJlr

-(id)initWithPoint:(CLLocation *)p
{
    self = [super init];
    if (self) {
        mPoints = [NSMutableArray arrayWithObject:p];
        mConnections = [[NSMutableArray alloc] init];
        
    }
    return self;
    
}



-(NSArray*)connections
{
    return [mConnections copy];
}


-(void)addNewJlrPoint:(CLLocation *)p
{
    if ([mPoints count]>2) {
    
    NSArray * a1 = [NSArray arrayWithObjects:[mPoints lastObject],p, nil];
    NSUInteger i = [mPoints indexOfObject:[mPoints lastObject]];
    NSArray * a2 = [NSArray arrayWithObjects:[mPoints objectAtIndex:i-1],p, nil];
    [mConnections addObject:a1];
    [mConnections addObject:a2];
    }
    [mPoints addObject:p];


}
//
//-(void)deleteConnection:(NSUInteger )connection
//{
//    
//
//    if (connection<=[mConnections count]) {
//        [mConnections removeObjectAtIndex:connection];
//    }
//    else
//    {
//        NSLog(@"there is something wrong about last deleting! not deleted");
//    }
//    
//}

































@end
