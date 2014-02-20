//
//  RRViewController.m
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import "RRViewController.h"
#import "RRAppDelegate.h"
#import "RRCity.h"
#import "RRCityViewController.h"

@interface RRViewController ()

@end

@implementation RRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // SharedApplication me genera un singleton
    self.title=@"City Guide";
    RRAppDelegate *delegate =(RRAppDelegate *)[[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UItableViewDataSource methods
// para inicializar la tabla
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(nil==cell)
    {
    cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    RRCity *thisCity= [cities objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:thisCity.cityName];
    [cell.imageView setImage:thisCity.cityPicture];
    return cell;
}

-(NSInteger ) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return cities.count;

}




#pragma mark UITableViewDelegate methos

// cuando clicamos en la celda

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    RRCity *thisCity = [cities objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
    
    RRAppDelegate *delegate =(RRAppDelegate *)[[UIApplication sharedApplication] delegate];
   // CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
    RRCityViewController *cityview = [[RRCityViewController alloc] initWithIndexPath:indexPath];
    [delegate.navController pushViewController:cityview animated:YES];
    
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
