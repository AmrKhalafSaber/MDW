//
//  AllDaysDeligBean.h
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllDays.h"
@protocol AllDaysDeligBean <NSObject>
-(void)getalldaysbeansmethod:(AllDays *) alldays;
-(void) retriveimagefromparsealldictionary:(NSMutableArray*) arrayoimage;
@end
