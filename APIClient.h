/* Made by Red16 */

#import "UIKit/UIKit.h"
#include <substrate.h>

#pragma once

@interface APIClient : NSObject

+ (void)paid:(void (^)(void))execute; //
+ (void)free:(void (^)(void))execute; //

@end