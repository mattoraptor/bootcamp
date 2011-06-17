//
//  exercise5_viewmanagementViewController.m
//  exercise5_viewmanagement
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "exercise5_viewmanagementViewController.h"

@implementation exercise5_viewmanagementViewController

@synthesize CountLabel;
@synthesize String;
@synthesize MutableString;
@synthesize IVarStorage;

- (void)dealloc
{
    [IVarStorage release];
    [MutableString release];
    [String release];
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.MutableString = [[NSMutableString alloc] initWithString:@"a string"];
    self.String = [[NSString alloc] initWithString:@"another string"];
    self.IVarStorage = [[NSMutableArray alloc] initWithCapacity:10];
    [self updateLabel: [MutableString retainCount]];
}

- (IBAction) retainButtonPressed
{
    [IVarStorage addObject:MutableString];
    [self updateLabel: [MutableString retainCount]];
}

- (IBAction) releaseButtonPressed
{
    if ([IVarStorage count] > 0){
        [IVarStorage removeLastObject];
    }
    else {
        UIActionSheet* aSheet = [[UIActionSheet alloc] 
                                 initWithTitle:@"Warning" 
                                 delegate:self 
                                 cancelButtonTitle:@"Don't do it!" 
                                 destructiveButtonTitle:@"Do IT!" 
                                 otherButtonTitles:nil];
        [aSheet showInView:self.view];
        [aSheet release];
    }
    
    [self updateLabel:[MutableString retainCount]];
}

- (void) updateLabel:(NSUInteger) count {
    self.CountLabel.text = [NSString stringWithFormat:@"%d",count];
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

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        NSLog(@"On second thought, I'd better not!");
    }
    else if (buttonIndex == 1) {
        NSLog(@"Excellent Choice!");
    }
}

@end