//
//  NetworkManager.h
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllDaysDeligDictionary.h"
//when no connection
#import <UIKit/UIKit.h>
#import "ExhibtorDeligBean.h"
#import "imagedeliagte.h"
@interface NetworkManager : NSObject
@property id<AllDaysDeligDictionary> deligallday;

+(NetworkManager*) getNetworkManager;
-(void) parsejson:(NSString*) str;

//when no connection
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property id<ExhibtorDeligBean> deligExhibtor;
@property id<imagedeliagte> deligimage;
@end
