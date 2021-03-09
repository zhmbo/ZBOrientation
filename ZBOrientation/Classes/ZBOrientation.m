//
//  ZBOrientation.m
//  ZBOrientation
//
//  Created by Jumbo on 2021/3/3.
//

#import "ZBOrientation.h"
#import "ZBSwizzle.h"

@implementation ZBOrientation

+ (void)load {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [ZBOrientation prjSupportedIO];
    [[[UIApplication sharedApplication].delegate class] zb_swizzleMethod:@selector(application:supportedInterfaceOrientationsForWindow:) withMethod:@selector(zb_application:supportedInterfaceOrientationsForWindow:) error:nil];
//    [[UIViewController class] zb_swizzleMethod:@selector(shouldAutorotate) withMethod:@selector(zb_shouldAutorotate) error:nil];
    [[UIViewController class] zb_swizzleMethod:@selector(supportedInterfaceOrientations) withMethod:@selector(zb_supportedInterfaceOrientations) error:nil];
#pragma clang diagnostic pop
}

+ (UIInterfaceOrientationMask)prjSupportedIO {
    static UIInterfaceOrientationMask io;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        io = [ZBOrientation currentSupportedIO];
    });
    return io;
}

// 当前工程所支持的方向
+ (UIInterfaceOrientationMask)currentSupportedIO {
    // 当前设备所支持的方向
    UIInterfaceOrientationMask supportedIO;

    // application delegate is responds:
    BOOL appDLisRS = [UIApplication.sharedApplication.delegate respondsToSelector:@selector(application: supportedInterfaceOrientationsForWindow:)];
    
    // 工程是否实现 application:supportedInterfaceOrientationsForWindow:】 的代理方法
    if (appDLisRS) {
        
        // 获取当前所支持的方向
        supportedIO = [UIApplication.sharedApplication.delegate application:UIApplication.sharedApplication supportedInterfaceOrientationsForWindow:UIApplication.sharedApplication.keyWindow];
       
    }else {
       // 通过 info.plist 获取所支持的方向
       supportedIO = [ZBOrientation infoSupportedIO];
    }
    return supportedIO;
}

// 获取Xcode配置的方向
+ (UIInterfaceOrientationMask)infoSupportedIO {
   
   NSArray *infoIOArray = [NSArray arrayWithArray:[[NSBundle mainBundle] infoDictionary][@"UISupportedInterfaceOrientations"]];
   
   NSMutableArray *maskOrt = [[NSMutableArray alloc] init];
   
   for (NSString *interfaceOrt in infoIOArray) {
       
       if ([interfaceOrt isEqualToString:@"UIInterfaceOrientationPortrait"]) {
           [maskOrt addObject:@(UIInterfaceOrientationMaskPortrait)];
       }else if ([interfaceOrt isEqualToString:@"UIInterfaceOrientationPortraitUpsideDown"]) {
           [maskOrt addObject:@(UIInterfaceOrientationMaskPortraitUpsideDown)];
       }else if ([interfaceOrt isEqualToString:@"UIInterfaceOrientationLandscapeLeft"]) {
           [maskOrt addObject:@(UIInterfaceOrientationMaskLandscapeLeft)];
       }else if ([interfaceOrt isEqualToString:@"UIInterfaceOrientationLandscapeRight"]) {
           [maskOrt addObject:@(UIInterfaceOrientationMaskLandscapeRight)];
       }else {
           [maskOrt addObject:@(UIInterfaceOrientationMaskAll)];
       }
   }
   return [ZBOrientation interfaceOrientationMaskFromArray:maskOrt];
}

// 将获取到的infoPlist中的方向转为 UIInterfaceOrientationMask 形式
+ (UIInterfaceOrientationMask)interfaceOrientationMaskFromArray:(NSArray *)maskOrt
{
    if (maskOrt.count == 1) {
        return [maskOrt[0] integerValue];
    }else if (maskOrt.count == 2) {
        return [maskOrt[0] integerValue] | [maskOrt[1] integerValue];
    }else if (maskOrt.count == 3) {
        return [maskOrt[0] integerValue] | [maskOrt[1] integerValue] | [maskOrt[2] integerValue];
    }else if (maskOrt.count == 4) {
        return [maskOrt[0] integerValue] | [maskOrt[1] integerValue] | [maskOrt[2] integerValue] | [maskOrt[3] integerValue];
    }else {
        return UIInterfaceOrientationMaskAll;
    }
}

@end

