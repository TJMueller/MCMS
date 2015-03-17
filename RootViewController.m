//
//  RootViewController.m
//  MCMS2
//
//  Created by Timothy Mueller on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface RootViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>

@property (strong, nonatomic) IBOutlet UITableView *rootTableView;
@property NSMutableArray *magicalCreatures;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDetailsTextField;
@property (strong, nonatomic) IBOutlet UIButton *addButtonOutlet;
@property MagicalCreature *selectedCreature;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setting Delegate
    self.creatureNameTextField.delegate = self;
    //on load disable add button
    self.addButtonOutlet.enabled = NO;


    MagicalCreature *creatureOne = [[MagicalCreature alloc]initWithName:@"Sphinx" andDetails:@"Egyptian"];
    MagicalCreature *creatureTwo = [[MagicalCreature alloc]initWithName:@"Dragon" andDetails:@"Shoots Fire"];
    MagicalCreature *creatureThree = [[MagicalCreature alloc]initWithName:@"Big Foot" andDetails:@"Big Shoes"];
    self.magicalCreatures = [NSMutableArray arrayWithObjects:creatureOne, creatureTwo, creatureThree, nil];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MagicalCreatureID"];
    MagicalCreature *creature = [self.magicalCreatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.details;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.magicalCreatures.count;
}

// When editing stops enable add button
-(void)textFieldDidEndEditing:(UITextField *)textField {

    if ([self.creatureNameTextField.text isEqualToString:@""]) {
        self.addButtonOutlet.enabled = NO;
    } else {
        self.addButtonOutlet.enabled = YES;
    }
}

# pragma mark - Buttons

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    //int magicalCreatureNumber = self.magicalCreatures.count +1;
   // NSString *magicalCreatureString = [NSString stringWithFormat:@"creature%i", magicalCreatureNumber];

    //adding a text field entry to the to do list array as an object
    //adding a corresponding black color object to the color array
    NSString *text = self.creatureNameTextField.text;
    NSString *detailText = self.creatureDetailsTextField.text;
    MagicalCreature *magicalCreature = [[MagicalCreature alloc]initWithName:text andDetails:detailText];
    [self.magicalCreatures addObject:magicalCreature];

    //hides the keyboard
    [self.creatureDetailsTextField endEditing:YES];
    [self.creatureNameTextField endEditing:YES];


    //resets the text field
    self.creatureNameTextField.text = @"";
    self.creatureDetailsTextField.text = @"";


    //reloads the table view to display the new data
    [self.rootTableView reloadData];

    self.addButtonOutlet.enabled = NO;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.rootTableView indexPathForCell:cell];
    self.selectedCreature = [self.magicalCreatures objectAtIndex:indexPath.row];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature =self.selectedCreature;
    vc.title = self.selectedCreature.name;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (YES)
    {
        [self.rootTableView reloadData];
    }
}


@end
