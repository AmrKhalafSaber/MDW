//
//  ExhibitorView.m
//  MDW
//
//  Created by JETS on 5/2/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ExhibitorView.h"
#import "NetworkManager.h"
#import "ParseExhibitorDictionary.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "Exhibitor.h"
#import "Reachability.h"
#import "DatabaseManager.h"
@interface ExhibitorView ()

@end

@implementation ExhibitorView
{
    NSString *status;
    NSMutableArray *imgretrive;
    NSMutableArray *companyretrivename;
    NSMutableArray *exhibtorretrivearrays;
    DatabaseManager *dbManager;
    
}
-(void)getExhibtorbeansmethod:(NSMutableArray *)Exhibtordelig
{
    /*
     
     for (Speakers *singlespeaker in Speakesdelig) {
     if (![singlespeaker.middleName  isEqual:@"  "]&& ![singlespeaker.middleName  isEqual:@" "]) {
     NSString *fullname=[NSString stringWithFormat:@"%@ %@ %@",singlespeaker.firstName,singlespeaker.middleName,singlespeaker.lastName];
     [speakername addObject:fullname];
     }else{
     NSString *fullname=[NSString stringWithFormat:@"%@ %@",singlespeaker.firstName,singlespeaker.lastName];
     [speakername addObject:fullname];
     }
     
     arrayofspeakers=Speakesdelig;
     NSString *companyname=singlespeaker.companyName;
     [speakercompany addObject:companyname];
     }
     */
    for (Exhibitor *singleExhibitor in Exhibtordelig) {
        [companyretrivename addObject:singleExhibitor.companyName];
    }
    exhibtorretrivearrays=Exhibtordelig;
    [_allexhibitors reloadData];
}
-(void)getarrayimagedatadeliagte:(NSMutableArray *)imgeallurl
{
    imgretrive=imgeallurl;
    // NSLog(@"imgurl %@",imgretrive[4]);
    [_allexhibitors reloadData];
}
-(void)afterparse:(NSDictionary *)dicc
{
    status=[dicc objectForKey:@"status"];
    //NSLog(@"%@",status);
    //to parse dicctionary using  parseurl .h class using it's method
    ParseExhibitorDictionary *parseurlobj=[ParseExhibitorDictionary new];
    parseurlobj.deligimage=self;
    parseurlobj.deligExhibtor=self;
    [parseurlobj getExhibtor:dicc];
    //NSLog(@"data value%@",alldaysobj.date);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_allexhibitors setDelegate:self];
    [_allexhibitors setDataSource:self];
    imgretrive=[NSMutableArray new];
    companyretrivename=[NSMutableArray new];
    exhibtorretrivearrays=[NSMutableArray new];
    Reachability *reachability=[Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus netstatus=[reachability currentReachabilityStatus];
    if (netstatus==NotReachable) {
        NSMutableArray *arrayofexibtor=[NSMutableArray new];
        dbManager=[DatabaseManager getDatabaseManager];
        arrayofexibtor=[dbManager retreiveExhibitors];
        [self getExhibtorbeansmethod:arrayofexibtor];
        NSLog(@"okokok");
    }else{
    NSString *stringurl=@"http://www.mobiledeveloperweekend.net/service/getExhibitors?userName=eng.medhat.cs.h@gmail.com";
    NetworkManager *networkmanager=[NetworkManager getNetworkManager];
    networkmanager.deligExhibtor=self;
    networkmanager.deligimage=self;
    networkmanager.deligallday=self;
    [networkmanager parsejson:stringurl];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [exhibtorretrivearrays count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *CellIdentifier = @"ExhibitorViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text=[companyretrivename objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageWithData:[[exhibtorretrivearrays objectAtIndex:indexPath.row] imageUrl]];

//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[imgretrive objectAtIndex:indexPath.row]]
//                      placeholderImage:[UIImage imageNamed:@"roger.jpg"]
//                               options:SDWebImageHighPriority];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [self.tableView reloadData];
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
