//
//  SpeakersView.h
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "SpeakersDeligBean.h"
#import "imagedeliagte.h"
@interface SpeakersView : UIViewController<AllDaysDeligDictionary,SpeakersDeligBean,imagedeliagte,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *allspeakers;



@end
