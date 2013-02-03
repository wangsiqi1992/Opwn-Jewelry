//
//  BWAppDelegate.h
//  Opwn Jewelry
//
//  Created by Siqi Wang on 13-2-3.
//  Copyright (c) 2013年 Bill Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
