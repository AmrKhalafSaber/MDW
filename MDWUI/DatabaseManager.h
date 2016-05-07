//
//  DatabaseManager.h
//  MDW
//
//  Created by JETS on 4/27/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllDays.h"
#import "Speakers.h"
#import "Exhibitor.h"
#import "User.h"
@interface DatabaseManager : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//+(NSManagedObjectContext*)getMOContext;
+(DatabaseManager*) getDatabaseManager;
-(void)saveInCoreData;

-(void)addUser:(User*)user;
-(NSMutableArray*)retreiveUserFromDB;
-(void)deleteUser;

-(void)addAllDays:(AllDays*)allDays;
-(void)deleteAllDays;
-(NSMutableArray*)retreiveAllDaysFromDB;

-(void)addSpeakers:(Speakers *)speakers;
-(NSMutableArray*)retreiveSpeakers;
-(void)deleteSpeakers;

-(void)addExhibitors:(Exhibitor *)exhibitor;
-(NSMutableArray*)retreiveExhibitors;
-(void)deleteExhibitors;

-(NSManagedObjectContext*)getContext;
@end
