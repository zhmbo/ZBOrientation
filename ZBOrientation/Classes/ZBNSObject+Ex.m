//
//  NSObject+Ex.m
//  ZBOrientation
//
//  Created by Jumbo on 2021/3/8.
//

#import "ZBNSObject+Ex.h"
#import "ZBOrientation.h"

@implementation NSObject (ZBNSObjectEx)

// 跳转时会替换原来方法更改屏幕总控
- (UIInterfaceOrientationMask)zb_application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAll;
}

// 在 application delegate 中如果没有实现就会调用 NSObject 扩展类中的方法
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientationMask)zb_supportedInterfaceOrientations {
    return [ZBOrientation prjSupportedIO];
}

@end
