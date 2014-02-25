//
//  RRAddCityControlerViewController.m
//  RRCurseApp8
//
//  Created by rrodriguez on 20/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import "RRAddCityControlerViewController.h"
#import "RRCity.h"
#import "RRAppDelegate.h"
#import "RRCity.h"
#import "RRViewController.h"
@interface RRAddCityControlerViewController ()

@end

@implementation RRAddCityControlerViewController

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
    
     // Do any additional setup after loading the view from its nib.
    self.title=@"New City";
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self action:@selector(saveCity:)];

    cityPicture = [UIImage imageNamed:@"defaultimage.jpg"];
    pickerController = [[UIImagePickerController alloc] init];
    pickerController.allowsEditing = NO;
    pickerController.delegate = self;
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
   
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
    UITableViewCell *cell= nil;
    if(indexPath.row==0)
    {
        cell=nameView;
    }
    if(indexPath.row==1)
    {
        UIImageView *pictureView = (UIImageView *)[pictureCell viewWithTag:777];
        pictureView.image = cityPicture;
        cell = pictureCell;
    }
    if(indexPath.row==2)
    {
        cell=descriptionView;
    }
      return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    if( indexPath.row == 0 ) {
        height = 44;
    } else if( indexPath.row == 1 ) {
        height = 93;
    } else {
        height = 420;
    }
    return height;    return height;
}


-(NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 3;
    
}



- (void)saveCity:(id)sender {
    RRAppDelegate *delegate =
    (RRAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *cities = delegate.cities;
    UITextField *nameEntry = (UITextField *)[nameView viewWithTag:777];
    UITextView *descriptionEntry =(UITextView *)[descriptionView viewWithTag:777];
    if ( nameEntry.text.length > 0 ) {
        RRCity *newCity = [[RRCity alloc] init];
        newCity.cityName = nameEntry.text;
        newCity.cityDescription = descriptionEntry.text;
          newCity.cityPicture = cityPicture;
        [cities addObject:newCity];
        RRViewController *viewController = delegate.rrviewController;
        [viewController.miTabla reloadData];
    }
    [delegate.navController popViewControllerAnimated:YES];
}


- (IBAction)addPicture:(id)sender {
    
    UITextField *nameEntry = (UITextField *)[nameView viewWithTag:777];
    [nameEntry resignFirstResponder];
    [self presentModalViewController:pickerController animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    cityPicture = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
     UIImageView *pictureView = (UIImageView *)[pictureCell viewWithTag:777];
    pictureView.image = cityPicture;
    [miTabla reloadData];
    
}
/*
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[self dismissViewControllerAnimated:YES completion:nil];
     cityPicture = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
     UIImageView *pictureView = (UIImageView *)[pictureCell viewWithTag:777];
     pictureView.image = cityPicture;
     [tableView reloadData];
     
     }
*/



@end
