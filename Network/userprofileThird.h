//
//  userprofileThird.h
//  MDW
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userprofileThird : UIViewController
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
/*@property (weak, nonatomic) IBOutlet UILabel *useremail;
@property (weak, nonatomic) IBOutlet UILabel *usermobiles;*/
@property (weak, nonatomic) IBOutlet UILabel *useremail;
@property (weak, nonatomic) IBOutlet UILabel *usermobiles;
@property (weak, nonatomic) IBOutlet UIImageView *zx;

@end
