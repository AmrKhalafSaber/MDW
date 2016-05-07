//
//  Agenda.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AllDays, Session;

@interface Agenda : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) AllDays *foundInDay;
@property (nonatomic, retain) NSSet *includesSessions;
@end

@interface Agenda (CoreDataGeneratedAccessors)

- (void)addIncludesSessionsObject:(Session *)value;
- (void)removeIncludesSessionsObject:(Session *)value;
- (void)addIncludesSessions:(NSSet *)values;
- (void)removeIncludesSessions:(NSSet *)values;

@end
