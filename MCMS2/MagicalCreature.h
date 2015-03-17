//
//  MagicalCreature.h
//  MCMS2
//
//  Created by Timothy Mueller on 3/17/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *details;

-(instancetype)initWithName:(NSString *)name andDetails:(NSString *)details;

@end
