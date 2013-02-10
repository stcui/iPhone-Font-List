//
//  FAppDelegate.m
//  Fonts
//
//  Created by stcui on 11-12-22.
//  Copyright (c) 2011年 stcui. All rights reserved.
//

#import "FAppDelegate.h"

#import "FViewController.h"

@implementation FAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window =
    [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.viewController = [[[FViewController alloc] init] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
