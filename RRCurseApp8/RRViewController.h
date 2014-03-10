//
//  RRViewController.h
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRCityDAO.h"

@interface RRViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
     NSMutableArray *cities;
    RRCityDAO *dao;
}
@property (weak, nonatomic) IBOutlet UITableView *miTabla;
@property (nonatomic, strong) RRCityDAO *dao;
@end
