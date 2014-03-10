//
//  RRCityViewController.h
//  RRCurseApp8
//
//  Created by rrodriguez on 19/02/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRCityDAO.h"

@interface RRCityViewController : UIViewController
{
    NSIndexPath *index;
    IBOutlet UIImageView *pictureView;
    IBOutlet UITextView *descriptionView;
        RRCityDAO *dao;
}
@property (nonatomic, strong) RRCityDAO *dao;
- (id)initWithIndexPath:(NSIndexPath *)indexPath;

@end
