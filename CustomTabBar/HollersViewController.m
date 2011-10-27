//
//  HollersViewController.m
//  CustomTabBar
//
//  Created by Nick ONeill on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HollersViewController.h"
#import "CreateHollerViewController.h"
#import "GroupsViewController.h"

@implementation HollersViewController
@synthesize tabBar;
#pragma mark - Demo custom tab bar
- (void)tabBarClicked:(NSUInteger)buttonIndex
{
    if( buttonIndex == 0 )
    {
        //This is the hollers tab already so don't do anything
    }
    if( buttonIndex == 1 )
    {
        //Display the create holler tab
        CreateHollerViewController *createHoller = [[CreateHollerViewController alloc] initWithNibName:@"CreateHollerViewController" bundle:nil];
        //[createHoller setDelegate:self];
        //[createHoller setMainFeed:(HollersViewController *)vc];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:createHoller];
        [createHoller release];
        [navController setModalPresentationStyle:UIModalPresentationFormSheet];
        [navController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentModalViewController:navController animated:YES];
        [navController release];
    }
    if( buttonIndex == 2 )
    {
        //Switch to the groups tab
        GroupsViewController *gvc = [[GroupsViewController alloc]init];
        [[self navigationController] pushViewController:gvc animated:NO];
        [gvc release];
        
        //Remove the view controller this is coming from, from the navigation controller stack
        NSMutableArray *allViewControllers = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        [allViewControllers removeObjectIdenticalTo:self];
        [[self navigationController] setViewControllers:allViewControllers animated:NO];
        [allViewControllers release];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tabBar = [[HBTabBarManager alloc]initWithViewController:self topView:self.view delegate:self selectedIndex:0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
