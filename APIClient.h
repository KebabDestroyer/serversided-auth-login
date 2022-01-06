/* Originally Made by Red16 */
/* Edited by whatisthat */
/* If you feel any respect for us please don't remove credits, thank you! */

#import "Nameobfuscation.h"

#import "UIKit/UIKit.h"
#include <substrate.h>

#pragma once

@interface APIClient : NSObject

+ (void)paid:(void (^)(void))execute; //
+ (void)free:(void (^)(void))execute; //

@end
