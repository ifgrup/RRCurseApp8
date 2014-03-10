//
//  RRCityViewController.m
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import "RRCityViewController.h"
#import "RRAppDelegate.h"
#import "RRCity.h"


@interface RRCityViewController ()

@end

@implementation RRCityViewController


   @synthesize dao;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithIndexPath: (NSIndexPath *)indexPath {
    if ( (self = [super init]) ) {
            index = indexPath;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Generamoos el singleton del appdelegate para capturar el array de citys
   // RRAppDelegate *delegate =(RRAppDelegate *)[[UIApplication sharedApplication] delegate];
 
    dao = [[RRCityDAO alloc] init];
	
	
    
    RRCity *thisCity = [[dao obtenerCities] objectAtIndex:index.row];
    self.title = thisCity.cityName;
    descriptionView.text = thisCity.cityDescription;
    descriptionView.editable = NO;
    pictureView.image = thisCity.cityPicture;
    
    
   // cities = delegate.cities;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
