//
//  NetworkManager.m
//  MDW
//
//  Created by JETS on 4/29/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
#import "DatabaseManager.h"
@implementation NetworkManager
{
    NSDictionary *mydic;
    //when no connection
    DatabaseManager *dbManager;
}
//when no connection
-(instancetype)init{
    self = [super init];
    if (self) {
        dbManager=[DatabaseManager getDatabaseManager];
        _managedObjectContext= [dbManager getContext];
    }
    return self;
}
+(NetworkManager *)getNetworkManager{
    static NetworkManager *manager=Nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (manager ==Nil)
            manager=[[NetworkManager alloc]init];
    });
    
    
    return manager;
}

-(void)parsejson:(NSString *)str{
    
    
    mydic=[NSDictionary new];
   
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //2
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 3
        
        mydic = (NSDictionary *)responseObject;
         //NSLog(@"mydic%@",mydic);
        [_deligallday afterparse:mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 4
        
        //when no connection
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Check your Connection"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        NSLog(@"inside error");
        [alertView show];
         
        NSLog(@"inside error");
        //getExhibitors
        if ([str isEqualToString:@"http://www.mobiledeveloperweekend.net/service/getExhibitors?userName=eng.medhat.cs.h@gmail.com"])
        {
            NSMutableArray *arrayofexibtor=[NSMutableArray new];
            arrayofexibtor=[dbManager retreiveExhibitors];
            [_deligExhibtor getExhibtorbeansmethod:arrayofexibtor];
        }
        
        
        
    }];
    // 5
    [operation start];
    
    
    // return mydic;
    
}
@end
