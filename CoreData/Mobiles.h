//
//  Mobiles.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exhibitor, Speaker, Speakers, User;

@interface Mobiles : NSManagedObject

@property (nonatomic, retain) NSString * mobileNumber;
@property (nonatomic, retain) Exhibitor *exhibitorMobile;
@property (nonatomic, retain) Speaker *speakerMobile;
@property (nonatomic, retain) User *userMobile;
@property (nonatomic, retain) Speakers *mobileForSpeaker;

@end
