//
//  Speakers.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mobiles, Phones;

@interface Speakers : NSManagedObject

@property (nonatomic, retain) NSNumber * iD;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * biography;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSData * imageUrl;
@property (nonatomic, retain) NSSet *speakerPhone;
@property (nonatomic, retain) NSSet *speakerMobile;
@end

@interface Speakers (CoreDataGeneratedAccessors)

- (void)addSpeakerPhoneObject:(Phones *)value;
- (void)removeSpeakerPhoneObject:(Phones *)value;
- (void)addSpeakerPhone:(NSSet *)values;
- (void)removeSpeakerPhone:(NSSet *)values;

- (void)addSpeakerMobileObject:(Mobiles *)value;
- (void)removeSpeakerMobileObject:(Mobiles *)value;
- (void)addSpeakerMobile:(NSSet *)values;
- (void)removeSpeakerMobile:(NSSet *)values;

@end
