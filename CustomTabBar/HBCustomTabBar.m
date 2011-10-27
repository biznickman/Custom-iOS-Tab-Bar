//
//  HollerCustomTabBar.m
//  Holler
//
//  Created by Nick ONeill on 8/17/11.
//  Copyright 2011 Webpreneur LLC. All rights reserved.
//

#import "HBCustomTabBar.h"


@implementation HBCustomTabBar
@synthesize groupsButton;
@synthesize hollerButton;
@synthesize hollersButton;

- (id)init
{
    self = [super init];
    if( self )
    {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 360, 320, 59);
        self.opaque = NO;
    }
    return self;
}

- (void)dealloc
{
    [groupsButton release];
    [hollerButton release];
    [hollersButton release];
    [super dealloc];
}

@end
