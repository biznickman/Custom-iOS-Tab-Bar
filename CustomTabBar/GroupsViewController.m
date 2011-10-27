//
//  GroupsViewController.m
//  CustomTabBar
//
//  Created by Nick ONeill on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GroupsViewController.h"
#import "HollersViewController.h"
#import "CreateHollerViewController.h"

@implementation GroupsViewController
@synthesize tabBar;

#pragma mark - Tab bar 
- (void)tabBarClicked:(NSUInteger)buttonIndex
{
    if( buttonIndex == 0 )
    {
        //This is the hollers tab already so don't do anything
        HollersViewController *hvc = [[HollersViewController alloc]init];
        [[self navigationController] pushViewController:hvc animated:NO];
        [hvc release];
        
        //Remove the view controller this is coming from, from the navigation controller stack
        NSMutableArray *allViewControllers = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        [allViewControllers removeObjectIdenticalTo:self];
        [[self navigationController] setViewControllers:allViewControllers animated:NO];
        [allViewControllers release];
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
        //We're on this tab already
    }
}

#pragma mark - View lifecycle
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
    tabBar = [[HBTabBarManager alloc]initWithViewController:self topView:self.view delegate:self selectedIndex:2];
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
