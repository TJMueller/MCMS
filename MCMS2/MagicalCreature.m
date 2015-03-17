//
//  MagicalCreature.m
//  MCMS2
//
//  Created by Timothy Mueller on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "MagicalCreature.h"


@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name andDetails:(NSString *)details andCreatureImage:(NSString *)image {
    self =[super init];
    if (self) {
        self.name = name;
        self.details = details;
        self.creatureImage = image;
    }
    return self;
}


@end
