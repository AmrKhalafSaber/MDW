//
//  SpeakerProfileView.h
//  MDW
//
//  Created by JETS on 5/1/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speakers.h"
@interface SpeakerProfileView : UIViewController
@property (weak,nonatomic)Speakers *deligSpeakersProfile;
@property (weak,nonatomic)NSDate *imageprofileurl;
@property (weak, nonatomic) IBOutlet UIImageView *speakersimage;

@property (weak, nonatomic) IBOutlet UILabel *speakersname;
@property (weak, nonatomic) IBOutlet UILabel *speakerstitle;
@property (weak, nonatomic) IBOutlet UILabel *speakerscompany;

@property (weak, nonatomic) IBOutlet UITextView *speakersbiog;

@end