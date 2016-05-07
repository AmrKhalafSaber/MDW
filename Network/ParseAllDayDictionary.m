//
//  ParseAllDayDictionary.m
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ParseAllDayDictionary.h"
#import "DatabaseManager.h"
#import "AllDays.h"
#import "Agenda.h"
#import "Session.h"
#import "Speaker.h"
#import "Mobiles.h"
#import "Phones.h"

#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })

@implementation ParseAllDayDictionary
{
    DatabaseManager *dbManager;
    AllDays *allDays;
    NSDictionary *result;
    NSSet *arrayagends;
    Agenda *agenda;
    NSMutableSet *arraysession;
    Session *session;
    Speaker *speaker;
    NSMutableArray *imgurlstring;//image for string url of speakers in sessions
    NSMutableSet *mobileset;//mobiles for string url of speakers in sessions
    NSMutableSet *phoneset;
    NSMutableSet *arrayspeaker;//speaker in sessions
    NSMutableSet *arrayagenda;//agenda in all days
}
-(instancetype)init{
    self = [super init];
    if (self) {
        dbManager=[DatabaseManager getDatabaseManager];
        _managedObjectContext= [dbManager getContext];
    }
    return self;
}
-(void)getAllDays:(NSDictionary *)mydic
{
   // NSLog(@"before logiing");
    NSString *status=[mydic objectForKey:@"status"];
    if ([status isEqual:@"view.success"])
    {
        [dbManager deleteAllDays];
        allDays=[NSEntityDescription insertNewObjectForEntityForName:@"AllDays"
                                              inManagedObjectContext:_managedObjectContext];
        imgurlstring=[NSMutableArray new];
        result = [mydic objectForKey:@"result"];
       // get date of alldays
        NSString *dateString=[result objectForKey:@"date"];
        //alldays date
        if (dateString !=(id)[NSNull null]) {
            double getDate=[dateString doubleValue];
            NSTimeInterval seconds = getDate / 1000;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
            NSLog(@"%@=======",date);
            [allDays setDate:date];
        }
        //all days max sessions
        [allDays setMaxSessions:[result objectForKey:@"maxSessions"]];
        
        
        //to fill array of agenda in alldays
        arrayagenda=[NSMutableSet new];
        arrayagends=[NSSet new];
        arrayagends=[result objectForKey:@"agendas"];
        for (NSDictionary *arrayobjects in arrayagends) {
            //define arrays session for every array of session in each agenda
            arraysession=[NSMutableSet new];
            //define agenda for every day inside loop of agendas(all days)
            agenda=[NSEntityDescription insertNewObjectForEntityForName:@"Agenda"
                                                 inManagedObjectContext:_managedObjectContext];
           //get component of agenda]
            
            NSString *dateString=[arrayobjects objectForKey:@"date"];
            if (dateString !=(id)[NSNull null]) {
            double getDate=[dateString doubleValue];
            NSTimeInterval seconds = getDate / 1000;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
            [agenda setDate:date];
            }
            
            NSString *enddateString=[arrayobjects objectForKey:@"endDate"];
            if (enddateString !=(id)[NSNull null]) {
                double getEndDate=[enddateString doubleValue];
                NSTimeInterval seconds = getEndDate / 1000;
                NSDate *enddate = [NSDate dateWithTimeIntervalSince1970:seconds];
                [agenda setEndDate:enddate];
            }
            //get session in agenda
            
            
            NSSet *sessiotype=[NSSet new];
            sessiotype=[arrayobjects objectForKey:@"sessions"];
            for (NSDictionary *sessionarray in sessiotype) {
                 arrayspeaker=[NSMutableSet new];
                session=[NSEntityDescription insertNewObjectForEntityForName:@"Session"
                                                      inManagedObjectContext:_managedObjectContext];
                [session setName:[sessionarray objectForKey:@"name"]];
                //NSLog(@"session checkname%@",session.name);
                [session setLocation:[sessionarray objectForKey:@"location"]];
                [session setID:[sessionarray objectForKey:@"id"]];
                [session setDescripe:[sessionarray objectForKey:@"description"]];
                [session setStatus:[sessionarray objectForKey:@"status"]];
                //get startdate
                NSString *startdateString=[sessionarray objectForKey:@"startDate"];
                if (startdateString !=(id)[NSNull null]) {
                    double getDate=[startdateString doubleValue];
                    NSTimeInterval seconds = getDate / 1000;
                    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:seconds];
                    [session setStartDate:startDate];
                   // NSLog(@"startdate %@",session.startDate);
                }
                //get end date
                NSString *enddateString=[sessionarray objectForKey:@"endDate"];
                if (enddateString !=(id)[NSNull null]) {
                    double getDate=[enddateString doubleValue];
                    NSTimeInterval seconds = getDate / 1000;
                    NSDate *endtDate = [NSDate dateWithTimeIntervalSince1970:seconds];
                    [session setEndDate:endtDate];
                    //NSLog(@"enddate %@",session.endDate);
                }
                [session setSessionType:[sessionarray objectForKey:@"sessionType"]];
               [session setLiked:[[NSNumber alloc]initWithBool:[[sessionarray objectForKey:@"liked"] boolValue]]];
               // [session setLiked:[NSNumber numberWithInt:(int)[[sessionarray valueForKey:@"is_following"] boolValue]]];
                //getsessiontag
                if ([sessionarray objectForKey:@"sessionTags"] !=[NSNull null]) {
                    [session setSession_tags:[sessionarray objectForKey:@"sessionTags"]];
                }
                //set set of speakers in each session
                NSSet *speakers=[NSSet new];
                speakers=[sessionarray objectForKey:@"speakers"];
                if (speakers != (id)[NSNull null])
                {
                    for (NSDictionary *arrayspeakers in speakers)
                    {
                        
                        speaker=[NSEntityDescription insertNewObjectForEntityForName:@"Speaker"
                                                              inManagedObjectContext:_managedObjectContext];
                        [speaker setID:[arrayspeakers objectForKey:@"id"]];
                        [speaker setFirstName:[arrayspeakers objectForKey:@"firstName"]];
                        [speaker setMiddleName:[arrayspeakers objectForKey:@"middleName"]];
                        [speaker setLastName:[arrayspeakers objectForKey:@"lastName"]];
//                        UIImage *imgtest=[UIImage imageNamed:@"roger.jpg"];
//                        [speaker setImageUrl:UIImageJPEGRepresentation(imgtest, 0.0)];
                    
                         [speaker setImageUrl:[NSData dataWithContentsOfURL:[NSURL URLWithString:[arrayspeakers objectForKey:@"imageURL"]]]];
                        /*
                        //getimage
                        
                        NSString *imageURL=[arrayspeakers objectForKey:@"imageURL"];
                        NSArray *arrimg=[imageURL componentsSeparatedByString:@"?"];
                        NSString *firtsstr=arrimg[0];
                        NSString *secondstr=arrimg[1];
                        NSString *fullimageurl=[NSString stringWithFormat:@"%@%@%@",firtsstr,@".jpg?",secondstr];
                        //to convert string url to date
                        [imgurlstring addObject:fullimageurl];
                        //save imgge
                        NSURL *url = [NSURL URLWithString:fullimageurl];
                        NSURLRequest *request = [NSURLRequest requestWithURL:url];
                        
                        
                        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *dataa, NSError *connectionError) {
                            
                            
                            [speaker setImageUrl:dataa];
                            [dbManager saveInCoreData];
                            //[core saveManagedObject];
                        }];
                        
                  */
                        [speaker setCompanyName:[arrayspeakers objectForKey:@"companyName"]];
                        [speaker setTitle:[arrayspeakers objectForKey:@"title"]];
                        [speaker setGender:[[NSNumber alloc]initWithBool:[[arrayspeakers objectForKey:@"gender"] boolValue]]];
                        [speaker setBiography:[arrayspeakers objectForKey:@"biography"]];
                        //set mobiles
                        NSSet *mobiles=[arrayspeakers objectForKey:@"mobiles"];
                        mobileset=[NSMutableSet new];
                        phoneset=[NSMutableSet new];
                        if (mobiles !=Nil) {
                            for (NSString *mobieinmobiles in mobiles) {
                                Mobiles *mobilenumber=[NSEntityDescription insertNewObjectForEntityForName:@"Mobiles"
                                                                                    inManagedObjectContext:_managedObjectContext];
                                [mobilenumber setMobileNumber:mobieinmobiles];
                                [mobileset addObject:mobilenumber];
                            }
                            // NSLog(@"number of mobileset %d",[mobileset count]);
                            
                            // NSLog(@"number of mobiles %d",[mobiles count]);
                        }
                        
                        NSSet *phones=[arrayspeakers objectForKey:@"phones"];
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
                        [speaker setHasMobile:mobileset];
                        [speaker setHasPhone:phoneset];
                        
                        
                        [arrayspeaker addObject:speaker];
                        
                        
                        //NSLog(@"%@",speaker.hasPhone);
                    }
                    
                }//end if check of speaker
                [session setSpeak:arrayspeaker];
                [arraysession addObject:session];
            } //end array of session in each ageenda
            [agenda setIncludesSessions:arraysession];
            [arrayagenda addObject:agenda];
        } //end array of agenda in all days
        
        [allDays setIncludesAgendas:arrayagenda];
        //[dbManager deleteAllDays];
        [dbManager saveInCoreData];
        //[dbManager addAllDays:allDays];
        
        //[_deligallday retriveimagefromparsealldictionary:imgurlstring];
        [_deligallday getalldaysbeansmethod:allDays];
      //NSLog(@"countt of imageurl %d",[imgurlstring count]);
      //NSLog(@"countt of speaker %d",[arrayspeaker count]);
    }//end check if status equal view.success
    /*
    for (Agenda *checkagenda in allDays.includesAgendas) {
        for (Session *checksession in checkagenda.includesSessions) {
            NSLog(@"name of session %@",checksession.name);
        }
    }*/
        
}//end method of get alldays
@end
