//
//  RRAppDelegate.h
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RRViewController;
@interface RRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//creamos los seter y getter para el controler
@property(strong,nonatomic) RRViewController *rrviewController;
@property (strong, nonatomic) NSMutableArray *cities;

// necesitamos un uinavigationcontroles para gestionar las vistas.
@property (strong, nonatomic) UINavigationController *navController;


@end
