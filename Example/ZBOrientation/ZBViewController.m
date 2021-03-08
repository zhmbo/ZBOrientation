//
//  ZBViewController.m
//  ZBOrientation
//
//  Created by itzhangbao on 03/03/2021.
//  Copyright (c) 2021 itzhangbao. All rights reserved.
//

#import "ZBViewController.h"
#import "ZBSDKViewController.h"

@interface ZBViewController ()

@end

@implementation ZBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ZBSDKViewController *sdk_vc = [ZBSDKViewController new];
    sdk_vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:sdk_vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
