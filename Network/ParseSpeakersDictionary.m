//
//  ParseSpeakersDictionary.m
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ParseSpeakersDictionary.h"
#import "Speakers.h"
#import "DatabaseManager.h"
#import "Mobiles.h"
#import "Phones.h"
@implementation ParseSpeakersDictionary
{
     DatabaseManager *dbManager;
     NSSet *result;
    Speakers *speakersbeanobj;
    NSMutableSet *mobileset;
    NSMutableSet *phoneset;
    NSMutableArray *arrayofimagesspeakers;
    NSMutableArray *arrayofspeakers;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        dbManager=[DatabaseManager getDatabaseManager];
        _managedObjectContext= [dbManager getContext];
    }
    return self;
}
-(void)getspeakers:(NSDictionary *)mydic
{
    arrayofimagesspeakers=[NSMutableArray new];
    arrayofspeakers=[NSMutableArray new];
    NSString *status=[mydic objectForKey:@"status"];
    if ([status isEqual:@"view.success"]) {
        [dbManager deleteSpeakers];
        result=[NSSet new];
        result=[mydic objectForKey:@"result"];
        for (NSDictionary  *speakersdictionary in result) {
            speakersbeanobj=[NSEntityDescription insertNewObjectForEntityForName:@"Speakers"
                                               inManagedObjectContext:_managedObjectContext];
            [speakersbeanobj setID:[speakersdictionary objectForKey:@"id"]];
            [speakersbeanobj setFirstName:[speakersdictionary objectForKey:@"firstName"]];
            [speakersbeanobj setLastName:[speakersdictionary objectForKey:@"lastName"]];
            [speakersbeanobj setCompanyName:[speakersdictionary objectForKey:@"companyName"]];
            [speakersbeanobj setTitle:[speakersdictionary objectForKey:@"title"]];
            //set mobiles
            NSSet *mobiles=[speakersdictionary objectForKey:@"mobiles"];
            mobileset=[NSMutableSet new];
            phoneset=[NSMutableSet new];
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
            NSSet *phones=[speakersdictionary objectForKey:@"phones"];
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
            [speakersbeanobj setSpeakerMobile:mobileset];
            [speakersbeanobj setSpeakerPhone:phoneset];
            [speakersbeanobj setMiddleName:[speakersdictionary objectForKey:@"middleName"]];
            [speakersbeanobj setBiography:[speakersdictionary objectForKey:@"biography"]];
            [speakersbeanobj setGender:[[NSNumber alloc]initWithBool:[[speakersdictionary objectForKey:@"gender"] boolValue]]];
            
            [speakersbeanobj setImageUrl:[NSData dataWithContentsOfURL:[NSURL URLWithString:[speakersdictionary objectForKey:@"imageURL"]]]];
            
  /*
            //getimage
            NSString *imageURL= [speakersdictionary objectForKey:@"imageURL"];
            
            NSArray *arrimg=[imageURL componentsSeparatedByString:@"?"];
            NSString *firtsstr=arrimg[0];
            NSString *secondstr=arrimg[1];
            NSString *fullimageurl=[NSString stringWithFormat:@"%@%@%@",firtsstr,@".jpg?",secondstr];
            
            [arrayofimagesspeakers addObject:fullimageurl];
            //download image
            NSURL *url = [NSURL URLWithString:fullimageurl];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            
            
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *dataa, NSError *connectionError) {
                
                
                [speakersbeanobj setImageUrl:dataa];
                //[core saveManagedObject];
            }];
   */         
            [arrayofspeakers addObject:speakersbeanobj];
        }
        [dbManager saveInCoreData];
        //NSLog(@"count of speakers %d ",[arrayofspeakers count]);
        [_deligimage getarrayimagedatadeliagte:arrayofimagesspeakers];
        [_deligspeakeers getpeakersbeansmethod:arrayofspeakers];
    }
}
@end
