//
//  userprofileSecond.h
//  MDW
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userprofileSecond : UIViewController
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIImageView *usercode;


@end
