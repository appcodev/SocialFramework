//
//  OZViewController.m
//  DemoSocialFramework1
//
//  Created by Chalermchon Samana on 8/19/13.
//  Copyright (c) 2013 Onzondev Innovation Co., Ltd. All rights reserved.
//

#import "OZViewController.h"

//step 1 import Social.framework and Accounts.framework to project (for iOS 6.0 or lastest..)
//step 2 code #import <Social/Social.h> in class viewcontroller
#import <Social/Social.h>

@interface OZViewController (){
    
    IBOutlet UITextView *sharedText;
    IBOutlet UIImageView *sharedImage;
}

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//step 3 manage data to share such as text, image, url
//step 4 code action to share
///////////////// action ////////////////////

- (IBAction)shareDefault:(UIButton *)sender {
    NSArray *Items = @[sharedText.text,sharedImage.image];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc]
                                              initWithActivityItems:Items
                                              applicationActivities:nil];
    
    [self presentViewController:activityView animated:YES completion:nil];
}

- (IBAction)shareToFacebook:(id)sender {
    SLComposeViewController *slView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [slView setInitialText:sharedText.text];
    [slView addImage:sharedImage.image];
    
    [self presentViewController:slView animated:YES completion:nil];
}

- (IBAction)shareToTwitter:(id)sender {
    SLComposeViewController *slView = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [slView setInitialText:sharedText.text];
    [slView addImage:sharedImage.image];
    
    [self presentViewController:slView animated:YES completion:nil];
}

@end
