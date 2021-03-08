//
//  ZBSwizzle.h
//  ZBOrientation
//
//  Created by Jumbo on 2021/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZBSwizzle)
+ (BOOL)zb_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)zb_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;
@end

NS_ASSUME_NONNULL_END
