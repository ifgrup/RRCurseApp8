//
//  RRAppDelegate.m
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import "RRAppDelegate.h"
#import "RRViewController.h"
#import "RRCity.h"

@implementation RRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    /*
    //Creamos difernetees citis para añadir al array
    RRCity *london = [[RRCity alloc] init];
    london.cityName = @"London";
    london.cityDescription = @"The capital of the United Kingdom and England.";
    london.cityPicture = [UIImage imageNamed:@"img1.png"];
    RRCity *sanFrancisco = [[RRCity alloc] init];
    sanFrancisco.cityName = @"San Francisco";
    sanFrancisco.cityDescription = @"The heart of the San Francisco Bay Area.";
    sanFrancisco.cityPicture = [UIImage imageNamed:@"3.png"];
    RRCity *sydney = [[RRCity alloc] init];
    sydney.cityName = @"Sydney";
    sydney.cityDescription = @"The largest city in Australia.";
    sydney.cityPicture = [UIImage imageNamed:@"4.png"];
    
    RRCity *madrid = [[RRCity alloc] init];
    madrid.cityName = @"Madrid";
    madrid.cityDescription = @"The capital and largest city of Spain.";
    madrid.cityPicture = [UIImage imageNamed:@"02.jpg"];
    RRCity *barcelona = [[RRCity alloc] init];
    barcelona.cityName = @"Barcelona";
    barcelona.cityDescription = @"The  best capital and largest city of Spain.";
    barcelona.cityPicture = [UIImage imageNamed:@"drslump.jpg"];

    
    //Creamos el mutable array con las ciudades creadas
    self.cities = [[NSMutableArray alloc]
                   initWithObjects:london, sanFrancisco, sydney, madrid, barcelona, nil];
    */
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //para lanzar la vista de iphone
        self.rrviewController = [[RRViewController alloc] initWithNibName:@"RRViewController" bundle:nil];
    } else {
        //para lanzar la vista de ipad
        self.rrviewController = [[RRViewController alloc] initWithNibName:@"RRViewController" bundle:nil];
    }
    
    
    //inicializamos el navcontroler
    
    self.navController = [[UINavigationController alloc]
                          initWithRootViewController:self.rrviewController];
    
    
    self.window.rootViewController = self.navController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
