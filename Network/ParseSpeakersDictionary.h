//
//  ParseSpeakersDictionary.h
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpeakersDeligBean.h"
#import "imagedeliagte.h"
@interface ParseSpeakersDictionary : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property id<SpeakersDeligBean> deligspeakeers;
@property id<imagedeliagte> deligimage;
- (void) getspeakers:(NSDictionary*)mydic;
@end
