/* Originally Made by Red16 */
/* Edited by whatisthat */
/* If you feel any respect for us please don't remove credits, thank you! */

#import "APIClient.h"

//This is in settings. Privacy/Advertising/Limit Ad Tracking
#import <AdSupport/ASIdentifierManager.h>

//SCLAlertView framework for nice alert views!
//Get it here : https://github.com/dogo/SCLAlertView
#import "SCLAlertView/SCLAlertView.h"

//Compile time string encryption macro
//It's always good to hide sensitive strings, especially the api!
//Get it here : https://github.com/joeyjurjens/iOS-Mod-Menu-Template-for-Theos/blob/master/template/Obfuscate.h
#import "Obfuscate.h"

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

@implementation APIClient

+ (void)paid:(void (^)(void))execute {
    timer(0.1){

                NSUUID *g_uudid = [[ASIdentifierManager sharedManager] advertisingIdentifier];
                NSString *uudid = [g_uudid UUIDString]; //log the uudid its an nsstring add it to your pop up view

//NSString *udid = @"100";
	
//uudid will be copied to paste board for testing purposes you should add a button to copy the text.

//open your app/game the uudid will be coppied for you, simply add it to a user inside the server
//You can add a button to copy the uudid but it's really not needed
UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
pasteboard.string = uudid;
				
					NSMutableURLRequest *s_url = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:NSSENCRYPT("https://rebel-apportionment.000webhostapp.com/APIClient.php?api=%@"), uudid]]];

					[s_url setHTTPMethod:NSSENCRYPT("GET")];

					NSURLSession *session = [NSURLSession sharedSession];
					NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:s_url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
						if (!error && response) {
							NSArray *listItems = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] componentsSeparatedByString:NSSENCRYPT(",")];

		int days = [listItems[0] intValue];
		int blacklisted = [listItems[1] intValue];
		if(days < 1) { //checking if user has less days than one

            timer(1) { //adding a timer to avoid corruption 

         SCLAlertView *expired = [[SCLAlertView alloc] initWithNewWindowWidth:300];

         expired.customViewColor = [UIColor colorWithRed:0.96 green:0.00 blue:0.65 alpha:1.0];
         expired.showAnimationType = SCLAlertViewShowAnimationFadeIn;
         expired.hideAnimationType = SCLAlertViewHideAnimationFadeOut;
         expired.shouldDismissOnTapOutside = NO;
         expired.backgroundType = SCLAlertViewBackgroundBlur;
         expired.cornerRadius = 10.0f;
         expired.backgroundViewColor = [UIColor colorWithRed:0.04 green:0.16 blue:0.24 alpha:1.0];
        
      [expired showError:NSSENCRYPT("Access Denied!") subTitle:NSSENCRYPT("\nApp will crash now. \nBuy access on : \nDiscord : whatisthat#9292") closeButtonTitle:nil duration:999999999.0]; //alert view example for non-existent/expired user
                 timer(4) {
                exit(0); 
				});
         });
		} 
		else if(blacklisted == 1) { //checking if user is blacklisted

           timer(1) {

         SCLAlertView *blacklisted = [[SCLAlertView alloc] initWithNewWindowWidth:300];

         blacklisted.customViewColor = [UIColor colorWithRed:0.96 green:0.00 blue:0.65 alpha:1.0];
         blacklisted.showAnimationType = SCLAlertViewShowAnimationFadeIn;
         blacklisted.hideAnimationType = SCLAlertViewHideAnimationFadeOut;
         blacklisted.shouldDismissOnTapOutside = NO;
         blacklisted.backgroundType = SCLAlertViewBackgroundBlur;
         blacklisted.cornerRadius = 10.0f;
         blacklisted.backgroundViewColor = [UIColor colorWithRed:0.04 green:0.16 blue:0.24 alpha:1.0];

         NSString *subTitleForBlacklisted = [NSString stringWithFormat:NSSENCRYPT("\nApp will crash now. \nYou were blacklisted for violating the rules. \nMade by : \nDiscord : whatisthat#9292 \nBlacklisting expiring in : %d days!"), days]; //showing the days until their blacklisting ends

      [blacklisted showError:NSSENCRYPT("You Were Blacklisted!") subTitle:subTitleForBlacklisted closeButtonTitle:nil duration:999999999.0]; //alert view example for a blacklisted user

                 timer(4) {
                exit(0); 
				});

        });
      } 
		else if((days > 1) && (blacklisted == 0)) { //checking if the user has more days than 1 and not blacklisted 
        
          timer(1) {

      SCLAlertView *success = [[SCLAlertView alloc] initWithNewWindowWidth:250];

      success.customViewColor = [UIColor colorWithRed:0.96 green:0.84 blue:0.65 alpha:1.0];
      success.showAnimationType = SCLAlertViewShowAnimationFadeIn;
      success.hideAnimationType = SCLAlertViewHideAnimationFadeOut;
      success.shouldDismissOnTapOutside = NO;
      success.backgroundType = SCLAlertViewBackgroundBlur;
      success.cornerRadius = 10.0f;
      success.backgroundViewColor = [UIColor colorWithRed:0.04 green:0.16 blue:0.24 alpha:1.0];
       
       NSString *subTitleForSuccess = [NSString stringWithFormat:NSSENCRYPT("\nTweak will load now. \nMade by : \nDiscord : whatisthat#9292 \nSubscription expiring in : %d days!"), days]; //days left of subscription

      [success showSuccess:NSSENCRYPT("Access Granted!") subTitle:subTitleForSuccess closeButtonTitle:nil duration:4.0]; //alert view example for an existing user with a current subscription 
                timer(4) {
                execute();
			     });

            });
     
            }
     
         }

     }];
	[dataTask resume];
  });

}

+ (void)free:(void (^)(void))execute { //didint bother with the free option, you can take from what I added in the paid if you wish
   timer(0.1){
       execute(); 
   });
}

@end
