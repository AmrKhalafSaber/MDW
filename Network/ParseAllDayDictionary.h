//
//  ParseAllDayDictionary.h
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllDaysDeligBean.h"
#import <UIKit/UIKit.h>
@interface ParseAllDayDictionary : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property id<AllDaysDeligBean> deligallday;
- (void) getAllDays:(NSDictionary*)mydic;

@end
