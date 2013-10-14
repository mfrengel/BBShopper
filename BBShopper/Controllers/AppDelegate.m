//
//  AppDelegate.m
//  BBShopper
//
//  Created by MFrengel on 10/13/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//
#import "AppDelegate.h"
#import "CategoryVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CategoryVC* vc = [[CategoryVC alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
