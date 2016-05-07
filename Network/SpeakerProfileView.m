//
//  SpeakerProfileView.m
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "SpeakerProfileView.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface SpeakerProfileView ()

@end

@implementation SpeakerProfileView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"speaker in view didload %@",_deligSpeakersProfile.firstName);
    [_speakersimage setImage:[UIImage imageWithData:_deligSpeakersProfile.imageUrl]];
    [_speakerstitle setText:_deligSpeakersProfile.title];
    [_speakersbiog setText:_deligSpeakersProfile.biography];
    [_speakerscompany setText:_deligSpeakersProfile.companyName];
    if (![_deligSpeakersProfile.middleName  isEqual:@" "] && ![_deligSpeakersProfile.middleName  isEqual: @"  "] )
    {
    NSString *fullname=[NSString stringWithFormat:@"%@ %@ %@",
                         _deligSpeakersProfile.firstName,_deligSpeakersProfile.middleName,_deligSpeakersProfile.lastName];
        [_speakersname setText:fullname];
   }
    else{
           NSString *fullname=[NSString stringWithFormat:@"%@ %@",_deligSpeakersProfile.firstName,_deligSpeakersProfile.lastName];
       [_speakersname setText:fullname];
        }
   /*
    [_speakersimage sd_setImageWithURL:[NSURL URLWithString:_imageprofileurl ]
                      placeholderImage:[UIImage imageNamed:@"roger.jpg"]
                               options:SDWebImageHighPriority];
    */
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
