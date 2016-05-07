//
//  UserProfile.m
//  MDW
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "UserProfile.h"
#import "DatabaseManager.h"
#import "User.h"
#import "Mobiles.h"
@interface UserProfile ()

@end

@implementation UserProfile
{
    DatabaseManager *dbManager;
     NSMutableArray *users;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    dbManager = [DatabaseManager getDatabaseManager];
    _managedObjectContext=[dbManager getContext];
    [dbManager deleteUser];
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_managedObjectContext];
    Mobiles *mob = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles" inManagedObjectContext:_managedObjectContext];
    mob.mobileNumber=@"0000000";
    //mob.mobileNumber=@"1111111";
    user.firstName=@"Omnia";
    user.middleName=@"aaaaa";
    user.lastName=@"aaaaa";
    user.code=@"ggggggggg";
    user.email=@"mmmmmmm";
    NSMutableSet *mobs=[NSMutableSet new];
    [mobs addObject:mob];
    user.hasMobile=mobs;
    [dbManager saveInCoreData];
    
    users = [NSMutableArray new];
    users = [dbManager retreiveUserFromDB];
    User *firstview=users[0];
    
    
    
    if (![firstview.middleName  isEqual:@" "] && ![firstview.middleName  isEqual: @"  "] )
    {
        NSString *fullname=[NSString stringWithFormat:@"%@ %@ %@",
                            firstview.firstName,firstview.middleName,firstview.lastName];
        NSLog(@">>%@",fullname);
        _username.text=fullname;
        //setname here
        //[_speakersname setText:fullname];
    }
    else{
        NSString *fullname=[NSString stringWithFormat:@"%@ %@",firstview.firstName,firstview.lastName];
        NSLog(@">>%@",fullname);
         _username.text=fullname;
        //setname here
       // [_speakersname setText:fullname];
    }
  _userimage.image=[UIImage imageWithData:[firstview imageUrl]];
  
    //_userjob.text=[firstview title ];
    //_usercomapny.text=[firstview companyName];
    
    //image+name+company+jobs
    //code
    //mobile+email+codeofmobileemail
   // printf("users number = %d",[users count]);
//    for (User *user in users) {
//        printf("User Name = %s",[user.firstName UTF8String]);
//    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
