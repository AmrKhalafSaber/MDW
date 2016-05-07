//
//  DayThreeView.m
//  MDWUI
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "DayThreeView.h"
#import "NetworkManager.h"
#import "ParseAllDayDictionary.h"
#import "Agenda.h"
#import "Session.h"
#import "Speaker.h"
#import "Reachability.h"
#import "DatabaseManager.h"
@interface DayThreeView ()

@end

@implementation DayThreeView

{
    NSString *status;
    NSMutableArray *imgretrive;
    NSMutableArray *showsessionall;
    NSMutableArray *showsessionallname;
    DatabaseManager *dbManager;
    //getalldaysof ddb
    NSMutableArray *retrivearraysofalldaysfromdb;
    
}
-(void)retriveimagefromparsealldictionary:(NSMutableArray *)arrayoimage
{
    imgretrive=arrayoimage;
    //NSLog(@"imgretrive for retrivemethod %lu",(unsigned long)[imgretrive count]);
    //NSLog(@"imgretrive for retrivemethod %@",imgretrive[0]);
    [_daythree reloadData];
}
-(void)getalldaysbeansmethod:(AllDays *)alldays
{
    NSArray *alldaysarray=[alldays.includesAgendas allObjects];
    Agenda *firstday=[alldaysarray objectAtIndex:1];
    
    // NSLog(@"alldaysbean.includesAgendas %d",[alldays.includesAgendas count]); //return three agenda
    // int i=0;
    
    for (Session *singlesession in firstday.includesSessions) {
        //NSLog(@"%@",singlesession.name);
        // NSLog(@"number of showagenda.includesSessions %d",[showagenda.includesSessions count]);
        
        [showsessionallname addObject:singlesession.name];
        [showsessionall addObject:singlesession];
        
        //NSLog(@"count of speaker in single session%d",[singlesession.speak count]);
    }
    NSLog(@"showsessionall in getalldaysbeansmethod %d",[showsessionall count]);
    
    [_daythree reloadData];
    // NSLog(@"count of speaker in single session %d  ,,, %d",[showsessionall count],[showsessionallname count]);
    //to write save data
    
    
    
}
-(void)afterparse:(NSDictionary *)dicc{
    
    ParseAllDayDictionary *parseurlobj=[ParseAllDayDictionary new];
    parseurlobj.deligallday=self;
    [parseurlobj getAllDays:dicc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //request for json
    self.navigationItem.hidesBackButton=YES;
    dbManager = [DatabaseManager getDatabaseManager];
    _managedObjectContext=[dbManager getContext];
    retrivearraysofalldaysfromdb=[NSMutableArray new];
    imgretrive=[NSMutableArray new];
    showsessionall=[[NSMutableArray alloc]init];
    showsessionallname=[NSMutableArray new];
    
    
    Reachability *reachability=[Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus netstatus=[reachability currentReachabilityStatus];
    if (netstatus==NotReachable) {
        
        
        //dbManager=[DatabaseManager getDatabaseManager];
        retrivearraysofalldaysfromdb=[dbManager retreiveAllDaysFromDB];
        printf("aaa %d",[retrivearraysofalldaysfromdb count]);
        for (AllDays *allD in retrivearraysofalldaysfromdb) {
            [self getalldaysbeansmethod:allD];
        }
        
        [_daythree reloadData];
        //NSLog(@"okokok");
    }else{
        //NSLog(@"before logiing");
        NSString *strurl=[[NSString alloc]initWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSessions?userName=eng.medhat.cs.h@gmail.com"];
        
        NetworkManager *networkmanagerObject=[NetworkManager getNetworkManager];
        networkmanagerObject.deligallday=self;
        [networkmanagerObject parsejson:strurl];
    }
    [_daythree reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [showsessionall count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstdayviewcell" forIndexPath:indexPath];
    
    // Configure the cell...[;
    //cell.textLabel.text=@"okok";
    //cell.textLabel.text=[showsessionallname objectAtIndex:indexPath.row];
    //  NSLog(@"number of session retrived from json or data base in cell %d",[showsessionall count]);
    cell.textLabel.text=[[showsessionall objectAtIndex:indexPath.row]name];
    //cell.imageView.image=[UIImage imageWithData:[imgretrive objectAtIndex:indexPath.row]];
    cell.imageView.image=[UIImage imageNamed:@"roger.jpg"];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end