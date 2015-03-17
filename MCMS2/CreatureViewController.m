//
//  CreatureViewController.m
//  MCMS2
//
//  Created by Jose Garcia on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

On edit button
-(IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {

    //sets the editing capability on or off depending on button's title
    //animates going both ways switching between the two
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";
        [self.rootTableView setEditing:YES animated:YES];
    } else{
        sender.title = @"Edit";
        [self.rootTableView setEditing:NO animated:YES];
    }
}


@end
