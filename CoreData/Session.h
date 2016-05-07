//
//  Session.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Agenda, Speaker;

@interface Session : NSManagedObject

@property (nonatomic, retain) NSString * descripe;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSNumber * iD;
@property (nonatomic, retain) NSNumber * liked;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sessionType;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * session_tags;
@property (nonatomic, retain) Agenda *foundInAgenda;
@property (nonatomic, retain) NSSet *speak;
@end

@interface Session (CoreDataGeneratedAccessors)

- (void)addSpeakObject:(Speaker *)value;
- (void)removeSpeakObject:(Speaker *)value;
- (void)addSpeak:(NSSet *)values;
- (void)removeSpeak:(NSSet *)values;

@end
