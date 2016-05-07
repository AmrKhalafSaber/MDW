//
//  LoginView.m
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "LoginView.h"
#import "NetworkManager.h"
#import "User.h"
#import "DatabaseManager.h"
#import "Phones.h"
#import "Mobiles.h"
#import "Reachability.h"
#import "AllDaysView.h"
#import "FirstViewController.h"
@interface LoginView ()

@end

@implementation LoginView
{
    NSDictionary *mydic;
    NSDictionary *result;
    User *loginUser;
    DatabaseManager *dbManager;
    NSMutableSet *mobileset;
    NSMutableSet *phoneset;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defualtsret=[NSUserDefaults new];
    NSString *getemaivallue=[defualtsret stringForKey:@"email"];
    NSLog(@"emailinnsuserdefault%@",getemaivallue);
    if ([getemaivallue isEqual:(id)[NSNull null] ])
    {
        AllDaysView *alldays=[[self storyboard]instantiateViewControllerWithIdentifier:@"alldayseIdent"];
        [self.navigationController pushViewController:alldays animated:YES];
     
    }
        
    
    mobileset=[NSMutableSet new];
    phoneset=[NSMutableSet new];
    mydic=[NSDictionary new];
    result=[NSDictionary new];
    dbManager = [DatabaseManager getDatabaseManager];
    _managedObjectContext=[dbManager getContext];
    loginUser=[NSEntityDescription insertNewObjectForEntityForName:@"User"
                                            inManagedObjectContext:_managedObjectContext];
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

- (IBAction)Login:(UIButton *)sender {
    //eng.medhat.cs.h@gmail.com medhat123
    NSString *username=  _UserName.text;
    //NSLog(@"username %@mm",username);
    NSString *password=_Password.text;
   // NSLog(@"passwaord %@",password);
   // NSString *starturl=@"http://www.mobiledeveloperweekend.net/service/login?userName=",username);
    //NSLog(@" %@",starturl);
    if (![username  isEqual:@" "] && ![password  isEqual: @""] ) {
        
        NSString *str=[[NSString alloc]initWithFormat:@"http://www.mobiledeveloperweekend.net/service/login?userName=%@&password=%@",username,password];
        //NSLog(@"str >>%@",str);
        NetworkManager *networkmaner=[NetworkManager getNetworkManager];
        networkmaner.deligallday=self;
        [networkmaner parsejson:str];
        
    }else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Try Again!"
                                                          message:@"Username or Passward Error"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        //username or passward error
    }
}
-(void)afterparse:(NSDictionary *)dicc{
    NSString *status=[ dicc objectForKey:@"status"];

    //NSLog(@" %@" ,status);
    
    if ([status isEqual:@"view.success"]) {
        [dbManager deleteUser];
        NSUserDefaults *defualts=[NSUserDefaults new];
        
        
        result=[dicc objectForKey:@"result"];
        [loginUser setID:[result objectForKey:@"id"]];
        [loginUser setEmail:[result objectForKey:@"email"]];
        [loginUser setFirstName:[result objectForKey:@"firstName"]];
        [loginUser setLastName:[result objectForKey:@"lastName"]];
        if ([result objectForKey:@"countryName"] != (id)[NSNull null])
        {
        [loginUser setCountry_name:[result objectForKey:@"countryName"]];
        }
        [loginUser setCityName:[result objectForKey:@"cityName"]];
        [loginUser setCompanyName:[result objectForKey:@"companyName"]];
        [loginUser setTitle:[result objectForKey:@"title"]];
        NSSet *phones=[result objectForKey:@"phones"];
        NSSet*mobiles=[result objectForKey:@"mobiles"];
        if (phones !=Nil) {
            for (NSString *phonesinphon in phones) {
                Phones *phonenumber=[NSEntityDescription insertNewObjectForEntityForName:@"Phones"
                                                                  inManagedObjectContext:_managedObjectContext];
                [phonenumber setPhoneNumber:phonesinphon];
                // NSLog(@"phonenumber.phoneNumber%@",phonenumber.phoneNumber);
                [phoneset addObject:phonenumber];
            }
            //NSLog(@"number of phoneset %d",[phoneset count]);
            
            //NSLog(@"number of phones %d",[phones count]);
            
        }
        if (mobiles !=Nil) {
            for (NSString *mobieinmobiles in mobiles) {
                Mobiles *mobilenumber=[NSEntityDescription insertNewObjectForEntityForName:@"Mobiles"
                                                                    inManagedObjectContext:_managedObjectContext];
                [mobilenumber setMobileNumber:mobieinmobiles];
                [mobileset addObject:mobilenumber];
            }
        }
        [loginUser setHasPhone:phoneset];
        [loginUser setHasMobile:mobileset];
        
        if ([result objectForKey:@"middleName"] != (id)[NSNull null])
        {
        [loginUser setMiddleName:[result objectForKey:@"middleName"]];
        }
        if ([result objectForKey:@"gender"] != (id)[NSNull null])
        {
        [loginUser setGender:[result objectForKey:@"gender"]];
        }
        [loginUser setCode:[result objectForKey:@"code"]];
        if ([result objectForKey:@"birthDate"] != (id)[NSNull null])
        {
        [loginUser setBirth_date:[result objectForKey:@"birthDate"]];
        }
        if ([result objectForKey:@"imageURL"] != (id)[NSNull null])
        {
        [loginUser setImageUrl:[NSData dataWithContentsOfURL:[NSURL URLWithString:[result objectForKey:@"imageURL"]]]];
        }
        [dbManager saveInCoreData];
        [defualts setObject:[result objectForKey:@"email"] forKey:@"email"];
        [defualts setObject:[result objectForKey:@"id"] forKey:@"id"];
        [defualts synchronize];
        NSString *getemaivallue=[defualts stringForKey:@"email"];
        NSLog(@">>>>%s",[getemaivallue UTF8String]);
        
        // NSLog(@"name of speaker  %@",[speakername objectAtIndex:indexPath.row]);
        
        
        AllDaysView *alldays=[[self storyboard]instantiateViewControllerWithIdentifier:@"alldayseIdent"];
        [self.navigationController pushViewController:alldays animated:YES];
        
    }else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Try Again!"
                                                          message:@"Username or Passward Error"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        //username or passward error
    
        NSLog(@"user name or password error");
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
@end
