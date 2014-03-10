//
//  RRAddCityControlerViewController.h
//  RRCurseApp8
//
//  Created by rrodriguez on 20/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRCityDAO.h"

@interface RRAddCityControlerViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
 
    IBOutlet UITableView *miTabla;
    IBOutlet UITableViewCell *descriptionView;
    
    IBOutlet UITableViewCell *nameView;
    
    IBOutlet UITableViewCell *pictureCell;
    
    UIImage *cityPicture;
    //NSMutableArray *cities;
    UIImagePickerController *pickerController;
    RRCityDAO *dao;


}
@property (nonatomic, strong) RRCityDAO *dao;
- (IBAction)addPicture:(id)sender;
-(IBAction)ocultarTeclado:(id)sender;
@end
