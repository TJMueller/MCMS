//
//  CreatureViewController.m
//  MCMS2
//
//  Created by Jose Garcia on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *nameCVCTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailCVCTextField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *cvcTableView;
@property NSMutableArray *accessoryArray;

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
    self.accessoryArray = self.creature.creatureAccessories;
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccessoriesCellID"];
    //to the left is the cell we are creating to the right is the array we are drawing from
    NSString *accessory = [self.accessoryArray objectAtIndex:indexPath.row];
//    NSString *temp = self.accessoryArray[indexPath.row];
    cell.textLabel.text = accessory;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.accessoryArray.count;
}


@end
