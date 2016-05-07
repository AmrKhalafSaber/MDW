//
//  Phones.h
//  MDW
//
//  Created by JETS on 4/18/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exhibitor, Speaker, Speakers, User;

@interface Phones : NSManagedObject

@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) Exhibitor *exhibitorPhone;
@property (nonatomic, retain) Speaker *speakerPhone;
@property (nonatomic, retain) User *userPhone;
@property (nonatomic, retain) Speakers *phoneForSpeaker;

@end
