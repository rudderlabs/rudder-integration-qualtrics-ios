//
//  RUDDERAppDelegate.m
//  Rudder-Qualtrics
//
//  Created by Abhishek on 08/24/2021.
//  Copyright (c) 2019 arnab. All rights reserved.
//

#import "RUDDERAppDelegate.h"
#import <Rudder/Rudder.h>
#import <RudderQualtricsFactory.h>

@implementation RUDDERAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    NSString *writeKey = @"1uvpRh0L8UoZj2HKHXE5A6E0RVx";
    NSString *dataPlaneUrl = @"https://a6516bec708b.ngrok.io";

  
    RSConfigBuilder *configBuilder = [[RSConfigBuilder alloc] init];
    [configBuilder withDataPlaneUrl:dataPlaneUrl];
    [configBuilder withLoglevel:RSLogLevelNone];
    [configBuilder withControlPlaneUrl:@"https://e91d300db7e0.ngrok.io"];
    [configBuilder withFactory:[RudderQualtricsFactory instance]];
    RSClient *rudderClient = [RSClient getInstance:writeKey config:[configBuilder build]];
    
    return YES;
}

+ (void) identify:(NSString *) properties withKey:(NSString *)key{
    [[RSClient sharedInstance] reset];
    NSMutableDictionary *traits2 = [[NSMutableDictionary alloc] init];
    [traits2 setObject:properties forKey:key];
    [[RSClient sharedInstance] identify:@"test_user_id"
                                 traits: traits2
    ];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
