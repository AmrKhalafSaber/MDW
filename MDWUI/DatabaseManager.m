//
//  DatabaseManager.m
//  MDW
//
//  Created by JETS on 4/27/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "DatabaseManager.h"
#import "AppDelegate.h"
@implementation DatabaseManager
{
    //AllDays *myalldays;
    NSMutableArray *userArr;
    NSMutableArray *allDaysArr;
    NSMutableArray *exhibitorArr;
    NSMutableArray *speakerArr;
    
}
-(instancetype)init{
    self = [super init];
    if (self) {
        AppDelegate *appDele = [[UIApplication sharedApplication]delegate];
        _managedObjectContext = [appDele managedObjectContext];
    }
    return self;
}
+(DatabaseManager *)getDatabaseManager{
    static DatabaseManager *manager=Nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (manager ==Nil)
            manager=[[DatabaseManager alloc]init];
    });
    
    
    return manager;
}
-(NSManagedObjectContext*)getContext{
    return _managedObjectContext;
}
-(void)saveInCoreData{
    NSError *error=nil;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Data Not Saved %@\n",error);
    }else{
        printf("Data Saved Success\n");
    }
}

-(void)addUser:(User*)user{
    
    NSMutableArray *arr= [self retreiveUserFromDB];
    if (arr != nil) {
        [self deleteUser];
    }
    [self saveInCoreData];
}

-(NSMutableArray*)retreiveUserFromDB{
    NSFetchRequest *fetchAllDays=[NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSError *error = nil;
    
    userArr = (NSMutableArray*)[_managedObjectContext executeFetchRequest:fetchAllDays error:&error];
    printf("Agenda count %lu ",(unsigned long)[userArr count]);
    return userArr;
}
-(void)deleteUser{
    NSMutableArray *arr= [self retreiveUserFromDB];
    printf("User arr count %lu ",(unsigned long)[arr count]);
    for (User *user in arr) {
        [_managedObjectContext deleteObject:(NSManagedObject *)user];
        
        [self saveInCoreData];
    }
}


-(void)addAllDays:(AllDays *)allDays{
    
    /*NSMutableArray *arr= [self retreiveAllDaysFromDB];
    if (arr != nil) {
      [self deleteAllDays];
    }*/
    
    [self saveInCoreData];
}

-(NSMutableArray*)retreiveAllDaysFromDB{
    
    NSFetchRequest *fetchAllDays=[NSFetchRequest fetchRequestWithEntityName:@"AllDays"];
    NSError *error = nil;
    allDaysArr = (NSMutableArray*)[_managedObjectContext executeFetchRequest:fetchAllDays error:&error];
    //printf("AllDays count %lu ",(unsigned long)[allDaysArr count]);
    return allDaysArr;
    }
-(void)deleteAllDays{
    
    NSMutableArray *arr= [self retreiveAllDaysFromDB];
    printf("AllDays arr count %lu ",(unsigned long)[arr count]);
    for (AllDays *alldays in arr) {
        [_managedObjectContext deleteObject:(NSManagedObject *)alldays];
        
        [self saveInCoreData];
    }
    
}

// Methods For Speakers
-(void)addSpeakers:(Speakers *)speakers{
    NSMutableArray *arr= [self retreiveSpeakers];
    if (arr != nil) {
        [self deleteSpeakers];
    }
    [self saveInCoreData];
}

-(NSMutableArray *)retreiveSpeakers{//will return array
    
    NSFetchRequest* speakerRequest=[NSFetchRequest fetchRequestWithEntityName:@"Speakers"];
    NSError *error = nil;
    speakerArr=(NSMutableArray*)[_managedObjectContext executeFetchRequest:speakerRequest error:&error];
    printf("speaker count %lu",(unsigned long)[speakerArr count]);
    
    return speakerArr;
}

-(void)deleteSpeakers{
    /*NSFetchRequest* fetchRequet=[NSFetchRequest fetchRequestWithEntityName:@"Speakers"];
    
    speakers=(NSMutableArray*)[_managedObjectContext executeFetchRequest:fetchRequet error:&error];*/
    
    NSMutableArray *arr= [self retreiveSpeakers];
    printf("Speaker arr count %lu ",(unsigned long)[arr count]);
   
    for (Speakers *spk in arr ) {
        [_managedObjectContext deleteObject:(NSManagedObject*)spk];
       
        [self saveInCoreData];
    }
}

// Methods For Exibtors

-(void)addExhibitors:(Exhibitor *)exhibitor{
    NSMutableArray *arr= [self retreiveExhibitors];
    if (arr != nil) {
        [self deleteExhibitors];
    }
    
    [self saveInCoreData];
}

-(NSMutableArray*)retreiveExhibitors{
    
    NSFetchRequest* exRequest=[NSFetchRequest fetchRequestWithEntityName:@"Exhibitor"];
    
    NSError* error=nil;
    
    exhibitorArr=(NSMutableArray*)[_managedObjectContext executeFetchRequest:exRequest error:&error];
    printf("exhibitor count %lu",(unsigned long)[exhibitorArr count]);
    
    return exhibitorArr;
}

-(void)deleteExhibitors{
    
    NSMutableArray *arr= [self retreiveExhibitors];
    printf("Exhibtor arr count %lu ",(unsigned long)[arr count]);
    
    for (Exhibitor *exhib in arr) {
        [_managedObjectContext deleteObject:(NSManagedObject *)exhib];
        
        [self saveInCoreData];
    }

}
@end
