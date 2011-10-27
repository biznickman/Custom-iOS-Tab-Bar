//
//  GroupsViewController.h
//  CustomTabBar
//
//  Created by Nick ONeill on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBTabBarManager.h"

@interface GroupsViewController : UIViewController <HBTabBarDelegate>
@property (nonatomic, retain) HBTabBarManager *tabBar;
@end
