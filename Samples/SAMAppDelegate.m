//
//  SAMAppDelegate.m
//  Samples
//
//  Created by Gary Morris on 5/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SAMAppDelegate.h"
#import "SAMViewController.h"

@implementation SAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    SAMViewController* rootVC = [[SAMViewController alloc] initWithNibName:nil bundle:nil];
    
    // Create the window and set the root view controller
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
@end
