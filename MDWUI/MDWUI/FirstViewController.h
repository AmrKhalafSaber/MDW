//
//  FirstViewController.h
//  MDWUI
//
//  Created by JETS on 4/27/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMSlideMenuMainViewController.h"

@interface FirstViewController : AMSlideMenuMainViewController
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

