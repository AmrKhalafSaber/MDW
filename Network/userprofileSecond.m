//
//  userprofileSecond.m
//  MDW
//
//  Created by JETS on 5/6/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "userprofileSecond.h"
#import "DatabaseManager.h"
#import "User.h"
#import "ZXingObjC.h"
@interface userprofileSecond ()

@end

@implementation userprofileSecond
{
    DatabaseManager *dbManager;
    NSMutableArray *users;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    dbManager = [DatabaseManager getDatabaseManager];
    _managedObjectContext=[dbManager getContext];
    users = [NSMutableArray new];
    users = [dbManager retreiveUserFromDB];
    User *secondView=users[0];
    NSString *zig=secondView.code;
    zig=@"omnia mahmoud saad";
    ZXMultiFormatWriter *write = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [write encode:zig
                                 format:kBarcodeFormatQRCode
                                  width:self.usercode.frame.size.width
                                 height:self.usercode.frame.size.width
                                  error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        self.usercode.image = [UIImage imageWithCGImage:image.cgimage];
    }
    //here write your zig
    //NSLog(@">>>%@",secondView.code);
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
