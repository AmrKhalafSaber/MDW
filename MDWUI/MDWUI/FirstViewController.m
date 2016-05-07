//
//  FirstViewController.m
//  MDWUI
//
//  Created by JETS on 4/27/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "Mobiles.h"
#import "Session.h"
#import "Speaker.h"
#import "Agenda.h"
#import "AllDays.h"
#import "DatabaseManager.h"
@interface FirstViewController ()

@end

@implementation FirstViewController{
    User *user;
    Mobiles *usrmob;
    Speaker *speakerForSession;
    Session *session;
    Agenda *agenda;
    AllDays *allDays;
    DatabaseManager *dbManager;
    NSMutableSet *usrmobiles;
    NSMutableSet *sessionsSet;
    NSMutableSet *speakersSet;
    NSMutableSet *agendasSet;
    NSMutableArray *users;
    NSMutableArray *allDaysArr;}

- (void)viewDidLoad {
    [super viewDidLoad];
   /* dbManager=[DatabaseManager new];
    //AppDelegate *appDele = [[UIApplication sharedApplication]delegate];
    _managedObjectContext= [dbManager getContext];
    [dbManager deleteUser];
    [dbManager deleteAllDays];
    user=[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:_managedObjectContext];
    
    allDays=[NSEntityDescription insertNewObjectForEntityForName:@"AllDays"
                                          inManagedObjectContext:_managedObjectContext];
    usrmobiles = [NSMutableSet new];
    speakersSet= [NSMutableSet new];
    sessionsSet= [NSMutableSet new];
    agendasSet = [NSMutableSet new];
    
    [user setFirstName:@"Amr"];
    [user setMiddleName:@"Khalaf"];
    [user setLastName:@"Saber"];
    [user setCityName:@"Minia"];
    [user setTitle:@"Java Developer"];
    
    for (int i = 0; i<2; i++) {
        
        //every time you add mobile should declear new object
        usrmob = [NSEntityDescription insertNewObjectForEntityForName:@"Mobiles"
                                               inManagedObjectContext:_managedObjectContext];
        
        
        [usrmob setMobileNumber:@"04444"];
        [usrmobiles addObject:usrmob ];
        
    }
    printf("\nArray of mobiles = %lu\n",(unsigned long)[usrmobiles count]);
    
    user.hasMobile=usrmobiles;
    //[_user addHasMobile:mobs];
    
    for (int i=0; i<2; i++) {
        speakerForSession=[NSEntityDescription insertNewObjectForEntityForName:@"Speaker"
                                                        inManagedObjectContext:_managedObjectContext];
        speakerForSession.firstName=@"sssss";
        speakerForSession.middleName=@"mmmm";
        speakerForSession.hasMobile=usrmobiles;
        [speakersSet addObject:speakerForSession];
    }
    for (int i=0; i<3; i++) {
        session=[NSEntityDescription insertNewObjectForEntityForName:@"Session"
                                              inManagedObjectContext:_managedObjectContext];
        session.location=@"iti";
        session.liked=0;
        session.startDate=[[NSDate alloc] initWithTimeIntervalSince1970:146081610000];
        session.speak=speakersSet;
        [sessionsSet addObject:session];
    }
    for (int i=0; i<3; i++) {
        agenda = [NSEntityDescription insertNewObjectForEntityForName:@"Agenda" inManagedObjectContext:_managedObjectContext];
        agenda.date=[[NSDate alloc] initWithTimeIntervalSinceReferenceDate:146081610000];
        agenda.includesSessions=sessionsSet;
        [agendasSet addObject:agenda];
    }
    
    allDays.maxSessions = 0;
    allDays.includesAgendas = agendasSet;
    [dbManager addAllDays:allDays]; */
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    ///////////////
    
   /* printf("\n-------------- User Data ------------\n");
    users=[dbManager retreiveUserFromDB];
    for (User *user in users) {
        //printf("id is %li Name = %s",(long)user.id.integerValue,[user.firstName UTF8String]);
        printf("\nUser name: %s %s %s\n",[[user firstName] UTF8String],[[user middleName] UTF8String],[[user lastName] UTF8String]);
        for(Mobiles *mobil in user.hasMobile){
            printf(" \nmobile is :%s\n",[[mobil mobileNumber] UTF8String]);
        }
    }
    printf("\n-------------- AllDays Data ------------\n");
    allDaysArr = [dbManager retreiveAllDaysFromDB];
    for (AllDays *all in allDaysArr) {
        printf(" \nfrom All Days\n");
        printf(" \nmaxSession %i\n",(int) all.maxSessions);
        
        for (Agenda *age in all.includesAgendas) {
            printf(" from agenda \n");
            NSLog(@" Agenda Date%@\n",age.date);
            
            for(Session *sess in age.includesSessions){
                printf(" Session location is :%s\n",[sess.location UTF8String]);
                for (Speaker *spe in sess.speak) {
                    printf(" Speaker name is :%s\n",[spe.firstName UTF8String]);
                    for (Mobiles *mob in spe.hasMobile) {
                        printf(" Speaker Mobile is :%s\n",[mob.mobileNumber UTF8String]);
                    }
                }
                printf("\n------------ Session -------------------\n");
            }
            printf("\n**************** Agenda ******************\n");
        }
        
    }*/

    //////////////
}
-(NSString *)segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath{
    NSString *identifire;
    switch (indexPath.row) {
            
        case 0:
            identifire=@"firstsegue";
            break;
        case 1:
            identifire=@"secondsegue";
            break;
        case 2:
            identifire=@"thirdsegue";
            break;
        case 3:
            identifire=@"fourthsegue";
            break;
        case 4:
            identifire=@"fifthsegue";
            break;
        case 5:
            identifire=@"sixthsegue";
            break;
            
    }
    return identifire;
}
-(void)configureRightMenuButton:(UIButton *)button{
    CGRect frame=button.frame;
    frame.origin=(CGPoint){0,0};
    frame.size=(CGSize){40,40};
    button.frame=frame;
    [button setImage:[UIImage imageNamed:@"icon-menu.png"] forState:UIControlStateNormal];
}
-(BOOL)deepnessForRightMenu{
    return YES;
    
}

-(AMPrimaryMenu)primaryMenu{
    return AMPrimaryMenuRight;
    
}
@end
