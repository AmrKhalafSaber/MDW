//
//  AllDaysView.h
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "AllDaysDeligBean.h"
@interface AllDaysView : UIViewController<AllDaysDeligDictionary,AllDaysDeligBean,UITableViewDataSource,UITableViewDelegate>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *alldays;

@end
