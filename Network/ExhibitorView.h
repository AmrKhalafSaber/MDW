//
//  ExhibitorView.h
//  MDW
//
//  Created by JETS on 5/2/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDaysDeligDictionary.h"
#import "ExhibtorDeligBean.h"
#import "imagedeliagte.h"
@interface ExhibitorView : UIViewController<AllDaysDeligDictionary,ExhibtorDeligBean,imagedeliagte,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *allexhibitors;


@end
