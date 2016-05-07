//
//  DayThreeView.h
//  MDWUI
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "AllDaysDeligBean.h"
@interface DayThreeView : UIViewController<AllDaysDeligDictionary,AllDaysDeligBean,UITableViewDataSource,UITableViewDelegate>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *daythree;

@end
