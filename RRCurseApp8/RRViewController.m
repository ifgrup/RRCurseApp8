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
#import "RRAddCityControlerViewController.h"

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
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
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
    cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    
    if (indexPath.row < cities.count ) {
        RRCity *thisCity= [cities objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:thisCity.cityName];
       [cell.imageView setImage:thisCity.cityPicture];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.editingAccessoryType = UITableViewCellAccessoryNone;
    
        if (self.editing) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    
    } else {
        cell.textLabel.text = @"Add New City !!!!...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    return cell;
}

-(NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
    
    
    NSInteger count = cities.count;
    if(self.editing) {
        count = count + 1;
    }
    return count;
    
    

}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated
{
    if( editing != self.editing ) {
        [super setEditing:editing animated:animated];
        [self.miTabla setEditing:editing animated:animated];
        
        
        NSMutableArray *indices = [[NSMutableArray alloc] init];
        for(int i=0; i < cities.count; i++ ) {
            [indices addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        NSArray *lastIndex = [NSArray
                              arrayWithObject:[NSIndexPath
                                               indexPathForRow:cities.count inSection:0]];
        
        
        if (editing == YES )
        {
            for(int i=0; i < cities.count; i++ )
            {
                UITableViewCell *cell =[self.miTabla cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [self.miTabla insertRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            for(int i=0; i < cities.count; i++ )
            {
                UITableViewCell *cell =[self.miTabla cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            [self.miTabla deleteRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    
    
 
    
   [self.miTabla reloadData];
    
      
}



#pragma mark UITableViewDelegate methos

// cuando clicamos en la celda

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*
    RRCity *thisCity = [cities objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    */
    
    RRAppDelegate *delegate =(RRAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
   // CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
   // RRCityViewController *cityview = [[RRCityViewController alloc] initWithIndexPath:indexPath];
    //[delegate.navController pushViewController:cityview animated:YES];
    
    
    
    
    if (indexPath.row < cities.count && !self.editing ) {
        RRCityViewController *cityview = [[RRCityViewController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:cityview animated:YES];
    }
    if( indexPath.row == cities.count && self.editing ) {
        
        NSLog(@"Puta mierda");
        RRAddCityControlerViewController *addcity= [[RRAddCityControlerViewController alloc] init];
        [delegate.navController pushViewController:addcity animated:YES];
    }
    
    
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < cities.count )
    {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

- (void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle) editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if( editing == UITableViewCellEditingStyleDelete ) {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                  withRowAnimation:UITableViewRowAnimationLeft];
    }
}


@end
