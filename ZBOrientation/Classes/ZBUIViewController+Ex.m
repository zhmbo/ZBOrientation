//
//  UIViewController+ZBUIViewControllerEx.m
//  ZBOrientation
//
//  Created by Jumbo on 2021/3/8.
//

#import "ZBUIViewController+Ex.h"
#import "ZBOrientation.h"

@implementation UIViewController (ZBUIViewControllerEx)

- (UIInterfaceOrientationMask)zb_supportedInterfaceOrientations {
    return [ZBOrientation prjSupportedIO];
}

@end
