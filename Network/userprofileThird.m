
//
//  userprofileThird.m
//  MDW
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "userprofileThird.h"
#import "DatabaseManager.h"
#import "User.h"
#import "Mobiles.h"
#import "ZXingObjC.h"
@interface userprofileThird ()
{
    DatabaseManager *dbManager;
    NSMutableArray *users;
}
@end

@implementation userprofileThird

- (void)viewDidLoad {
    [super viewDidLoad];
    dbManager = [DatabaseManager getDatabaseManager];
    _managedObjectContext=[dbManager getContext];
    users = [NSMutableArray new];
    users = [dbManager retreiveUserFromDB];
    User *thirdview=users[0];
    NSString *email=thirdview.email;
    NSString *zig=@"";
    // NSLog(@">>>%@",thirdview.email);
    _useremail.text=thirdview.email;
    if ([thirdview.hasMobile count] > 0) {
        NSString *mobileappend=@"";
        for (Mobiles *single in thirdview.hasMobile) {
            mobileappend=[mobileappend stringByAppendingString:single.mobileNumber];
            
        }
        _usermobiles.text=mobileappend;
        zig=[zig stringByAppendingString:email];
        zig=[zig stringByAppendingString:mobileappend];
    }else
    {
        _usermobiles.text=@"No Mobile";
        zig=[zig stringByAppendingString:email];
    }
    
    //here write your zigzing for contact using nsstring zig
    
    
    
    
    ZXMultiFormatWriter *write = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [write encode:zig
                                 format:kBarcodeFormatQRCode
                                  width:self.zx.frame.size.width
                                 height:self.zx.frame.size.width
                                  error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        self.zx.image = [UIImage imageWithCGImage:image.cgimage];
    }
    
    
    //thirdview.email
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
