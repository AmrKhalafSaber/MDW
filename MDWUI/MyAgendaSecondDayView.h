//
//  MyAgendaSecondDayView.h
//  MDWUI
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "AllDaysDeligBean.h"
@interface MyAgendaSecondDayView : UIViewController<AllDaysDeligDictionary,AllDaysDeligBean,UITableViewDelegate,UITableViewDataSource>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITableView *second;


@end
