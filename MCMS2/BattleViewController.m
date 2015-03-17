//
//  BattleViewController.m
//  MCMS2
//
//  Created by Jose Garcia on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "BattleViewController.h"
#import "CreatureViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *battleWinnerImageView;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.creature.name isEqualToString:@"Big Foot"])  {
        self.battleWinnerImageView.image = [UIImage imageNamed:@"creatureThree"];

    }
    else {
        self.battleWinnerImageView.image = [UIImage imageNamed:@"creatureOne"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
