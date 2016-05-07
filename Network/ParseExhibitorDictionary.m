//
//  ParseExhibitorDictionary.m
//  MDW
//
//  Created by JETS on 5/2/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ParseExhibitorDictionary.h"
#import "Exhibitor.h"
#import "DatabaseManager.h"
#import "Mobiles.h"
#import "Phones.h"

@implementation ParseExhibitorDictionary
{
    DatabaseManager *dbManager;
    NSSet *result;
    NSMutableSet *phoneset;
    NSMutableSet *mobileset;
    Exhibitor *exhibitorbeanobj;
    NSMutableArray *arrayofimagesexihitor;
    NSMutableArray *arrayofExihitor;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        dbManager=[DatabaseManager getDatabaseManager];
        _managedObjectContext= [dbManager getContext];
        
    }
    return self;
}
-(void)getExhibtor:(NSDictionary *)mydic
{
    arrayofimagesexihitor=[NSMutableArray new];
    arrayofExihitor=[NSMutableArray new];
    NSString *status=[mydic objectForKey:@"status"];
    //NSLog(@"status %@",status);
    if ([status isEqual:@"view.success"])
    {
        [dbManager deleteExhibitors];
        result=[NSSet new];
        result=[mydic objectForKey:@"result"];
        for (NSDictionary *ExhibitorDictionary in result)
        {
           exhibitorbeanobj=[NSEntityDescription insertNewObjectForEntityForName:@"Exhibitor"
                                                                      inManagedObjectContext:_managedObjectContext];
            [exhibitorbeanobj setID:[ExhibitorDictionary objectForKey:@"id"]];
            [exhibitorbeanobj setEmail:[ExhibitorDictionary objectForKey:@"email"]];
            [exhibitorbeanobj setCountryName:[ExhibitorDictionary objectForKey:@"countryName"]];
            [exhibitorbeanobj setCityName:[ExhibitorDictionary objectForKey:@"cityName"]];
            [exhibitorbeanobj setCompanyName:[ExhibitorDictionary objectForKey:@"companyName"]];
             mobileset=[NSMutableSet new];
             phoneset=[NSMutableSet new];
            NSSet *mobiles=[ExhibitorDictionary objectForKey:@"mobiles"];
            if (mobiles !=Nil) {
                for (NSString *mobieinmobiles in mobiles) {
                    Mobiles *mobilenumber=[NSEntityDescription insertNewObjectForEntityForName:@"Mobiles"
                                                                        inManagedObjectContext:_managedObjectContext];
                    [mobilenumber setMobileNumber:mobieinmobiles];
                    //NSLog(@"mobile nmber %@",mobilenumber.mobileNumber);
                    [mobileset addObject:mobilenumber];
                }
                // NSLog(@"number of mobileset %d",[mobileset count]);
                
                // NSLog(@"number of mobiles %d",[mobiles count]);
            }
            NSSet *phones=[ExhibitorDictionary objectForKey:@"phones"];
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
            [exhibitorbeanobj setHasMobile:mobileset];
            [exhibitorbeanobj setHasPhone:phoneset];
            [exhibitorbeanobj setCompanyAbout:[ExhibitorDictionary objectForKey:@"companyAbout"]];
            [exhibitorbeanobj setFax:[ExhibitorDictionary objectForKey:@"fax"]];
            [exhibitorbeanobj setContactName:[ExhibitorDictionary objectForKey:@"contactName"]];
            [exhibitorbeanobj setContactTitle:[ExhibitorDictionary objectForKey:@"contactTitle"]];
            [exhibitorbeanobj setCompanyUrl:[ExhibitorDictionary objectForKey:@"companyUrl"]];
            
            [exhibitorbeanobj setImageUrl:[NSData dataWithContentsOfURL:[NSURL URLWithString:[ExhibitorDictionary objectForKey:@"imageURL"]]]];
    /*
            //default image
            UIImage *defaultimage=[UIImage imageNamed:@"roger.jpg"];
            NSDate *defaultdateimage=UIImageJPEGRepresentation(defaultimage, 0.7);
            [exhibitorbeanobj setImageUrl:defaultdateimage];
            //NSLog(@"data of %@",exhibitorbeanobj.imageUrl);
         
            //getimage
            NSString *imageURL= [ExhibitorDictionary objectForKey:@"imageURL"];
            NSArray *arrimg=[imageURL componentsSeparatedByString:@"?"];
            NSString *firtsstr=arrimg[0];
            NSString *secondstr=arrimg[1];
            NSString *fullimageurl=[NSString stringWithFormat:@"%@%@%@",firtsstr,@".jpg?",secondstr];
            [arrayofimagesexihitor addObject:fullimageurl];
            //download image
            NSURL *url = [NSURL URLWithString:[ExhibitorDictionary objectForKey:@"imageURL"]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *dataa, NSError *connectionError) {
                
                
                [exhibitorbeanobj setImageUrl:dataa];
                [dbManager saveInCoreData];
                
                //[dbManager addExhibitors:exhibitorbeanobj];
            }];
            
       */
            [arrayofExihitor addObject:exhibitorbeanobj];
            //[dbManager addExhibitors:exhibitorbeanobj];
            [dbManager saveInCoreData];
        }
        //NSLog(@"id %d",[arrayofimagesexihitor count]);
        //[dbManager deleteUser];
        
        [_deligimage getarrayimagedatadeliagte:arrayofimagesexihitor];
        [_deligExhibtor getExhibtorbeansmethod:arrayofExihitor];
    }
}
@end
