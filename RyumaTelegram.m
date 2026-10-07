#import <UIKit/UIKit.h>

__attribute__((constructor))
static void RyumaTelegramInit(void)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL *url = [NSURL URLWithString:@"https://t.me/ryumahackff"];

        if (url) {
            [[UIApplication sharedApplication] openURL:url
                                               options:@{}
                                     completionHandler:nil];
        }
    });
}
