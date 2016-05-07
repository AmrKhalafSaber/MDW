//
//  MyAgendaTableView.h
//  MDW
//
//  Created by JETS on 5/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "AllDaysDeligBean.h"

@interface MyAgendaTableView : UIViewController<AllDaysDeligDictionary,AllDaysDeligBean,UITableViewDataSource,UITableViewDelegate>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *allmyagenda;



@end
