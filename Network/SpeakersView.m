//
//  SpeakersView.m
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SpeakersView.h"
#import "NetworkManager.h"
#import "ParseSpeakersDictionary.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SpeakerProfileView.h"
#import "Reachability.h"
#import "DatabaseManager.h"
@interface SpeakersView ()

@end

@implementation SpeakersView
{
     NSString *status;
    NSMutableArray *imgretrive;
    NSMutableArray *speakername;
    NSMutableArray *speakercompany;
    NSMutableArray *arrayofspeakers;
     DatabaseManager *dbManager;
}
-(void)viewDidAppear:(BOOL)animated
{
    [_allspeakers reloadData];
}
-(void)getarrayimagedatadeliagte:(NSMutableArray *)imgeallurl
{
    imgretrive=imgeallurl;
   // NSLog(@"imgurl %@",imgretrive[4]);
    [_allspeakers reloadData];
}
-(void)getpeakersbeansmethod:(NSMutableArray *)Speakesdelig
{
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
        [_allspeakers reloadData];
    }
}
-(void)afterparse:(NSDictionary *)dicc
{
    
    status=[dicc objectForKey:@"status"];
    //NSLog(@"%@",reslt);
    //to parse dicctionary using  parseurl .h class using it's method
    //NSLog(@"data value%@",alldaysobj.date);
    ParseSpeakersDictionary *parse=[ParseSpeakersDictionary new];
    parse.deligimage=self;
    parse.deligspeakeers=self;
    [parse getspeakers:dicc];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [_allspeakers setDelegate:self];
    [_allspeakers setDataSource:self];
    
    
    speakername=[NSMutableArray new];
    imgretrive=[NSMutableArray new];
    speakercompany=[NSMutableArray new];
    arrayofspeakers=[NSMutableArray new];
    Reachability *reachability=[Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus netstatus=[reachability currentReachabilityStatus];
    if (netstatus==NotReachable) {
        NSMutableArray *arrayofSpeakers=[NSMutableArray new];
        dbManager=[DatabaseManager getDatabaseManager];
        arrayofSpeakers=[dbManager retreiveSpeakers];
        [self getpeakersbeansmethod:arrayofSpeakers];
        //NSLog(@"okokok");
    }else{
    NetworkManager *networkmanager=[NetworkManager getNetworkManager];
    networkmanager.deligallday=self;
    //http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h%40gmail.com
    NSString *str=[[NSString alloc]initWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=eng.medhat.cs.h@gmail.com"];
    [networkmanager parsejson:str];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [arrayofspeakers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SpeakersViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    
    //cell.textLabel.text=[[arrayofspeakers objectAtIndex:indexPath.row] firstName] ;
    cell.textLabel.text=[speakername objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[[arrayofspeakers objectAtIndex:indexPath.row] companyName];
    cell.imageView.image=[UIImage imageWithData:[[arrayofspeakers objectAtIndex:indexPath.row] imageUrl]];
   
    /*
    //show image
    NSURL *url = [NSURL URLWithString:[imgretrive objectAtIndex:4]];
    // NSURL *url = [NSURL URLWithString:[imgretrive objectAtIndex:indexPath.row]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"roger.jpg"];
   
    // __weak UITableViewCell *weakCell = cell;
    
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       cell.imageView.image=image;
                                       //cell.imageView.image = image;
                                       [cell layoutSubviews];
                                       //[weakCell setNeedsLayout];
                                       
                                   } failure:nil];*/
    
  //  [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[imgretrive objectAtIndex:indexPath.row]]
  //                    placeholderImage:[UIImage imageNamed:@"roger.jpg"]
   //                    options:SDWebImageHighPriority];
    //[cell layoutSubviews];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSLog(@"name of speaker  %@",[speakername objectAtIndex:indexPath.row]);
    
    
    SpeakerProfileView *profile=[[self storyboard]instantiateViewControllerWithIdentifier:@"SpeakerProfileIdent"];
    
    //profile.imageprofileurl=(nsda)[[arrayofspeakers objectAtIndex:indexPath.row] imageUrl];
    profile.deligSpeakersProfile=[arrayofspeakers objectAtIndex:indexPath.row];
   // NSLog(@"name of speaker  %@",profile.deligSpeakersProfile.firstName );
    [self.navigationController pushViewController:profile animated:YES];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
