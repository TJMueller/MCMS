//
//  CreatureViewController.m
//  MCMS2
//
//  Created by Jose Garcia on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameCVCTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailCVCTextField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *cvcTableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameCVCTextField.text = self.creature.name;
    self.detailCVCTextField.text = self.creature.details;
    self.editing = NO;
    self.nameCVCTextField.enabled = NO;
    self.detailCVCTextField.enabled = NO;
    NSString *temp = self.creature.creatureImage;
    self.creatureImageView.image = [UIImage imageNamed:temp];
}

//On edit button
-(IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    self.creature.name = self.nameCVCTextField.text;
    self.creature.details = self.detailCVCTextField.text;
    
    if (self.editing) {
        self.editing = NO;
        self.nameCVCTextField.enabled = NO;
        self.detailCVCTextField.enabled = NO;
        sender.title = @"Edit";
    } else
    {
        self.editing = YES;
        self.nameCVCTextField.enabled = YES;
        self.detailCVCTextField.enabled = YES;
        sender.title = @"Done";
    }

}


@end
