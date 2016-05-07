//
//  AllDays.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Agenda;

@interface AllDays : NSManagedObject

@property (nonatomic, retain) NSNumber * maxSessions;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *includesAgendas;
@end

@interface AllDays (CoreDataGeneratedAccessors)

- (void)addIncludesAgendasObject:(Agenda *)value;
- (void)removeIncludesAgendasObject:(Agenda *)value;
- (void)addIncludesAgendas:(NSSet *)values;
- (void)removeIncludesAgendas:(NSSet *)values;

@end
