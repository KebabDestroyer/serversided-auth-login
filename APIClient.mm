/* Made by Red16 */

#import "APIClient.h"

//This is in settings. Privacy/Advertising/Limit Ad Tracking
#import <AdSupport/ASIdentifierManager.h>

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

@implementation APIClient

+ (void)paid:(void (^)(void))execute {
    timer(0.1){

                NSUUID *g_uudid = [[ASIdentifierManager sharedManager] advertisingIdentifier];
                NSString *uudid = [g_uudid UUIDString]; //log the uudid its an nsstring add it to your pop up view

//NSString *udid = @"100";
	
//uudid will be copied to paste board for testing purposes you should add a button to copy the text.

//open your app/game the uudid will be coppied for you
UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
pasteboard.string = uudid;
				
					NSMutableURLRequest *s_url = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://website.com/APIClient.php?api=%@", uudid]]];

					[s_url setHTTPMethod:@"GET"];

					NSURLSession *session = [NSURLSession sharedSession];
					NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:s_url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
						if (!error && response) {
							NSArray *listItems = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] componentsSeparatedByString:@","];

		int days = [listItems[0] intValue];
		int blacklisted = [listItems[1] intValue];
		if(days < 1 || blacklisted == 1) {
				timer(0.1){
                exit(0); //not good exit, show expire message then exit?
				});
		} 
		else {
			timer(0.1){
                execute(); //good show success message?
			});
       }
    }
	}];
	[dataTask resume];
  });
}

+ (void)free:(void (^)(void))execute {
   timer(0.1){
       execute(); //possibly remove this or comment out execute();
   });
}

@end

