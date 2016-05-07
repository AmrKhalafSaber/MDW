//
//  ParseExhibitorDictionary.h
//  MDW
//
//  Created by JETS on 5/2/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import <CoreData/CoreData.h>
#import "ExhibtorDeligBean.h"
#import "ExhibtorDeligBean.h"
#import "imagedeliagte.h"
@interface ParseExhibitorDictionary : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property id<ExhibtorDeligBean> deligExhibtor;
@property id<imagedeliagte> deligimage;
- (void) getExhibtor:(NSDictionary*)mydic;
@end
