#import <UIKit/UIKit.h>

__attribute__((constructor))
static void RyumaInit(void)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = nil;

        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (![scene isKindOfClass:[UIWindowScene class]]) continue;

            for (UIWindow *w in ((UIWindowScene *)scene).windows) {
                if (w.isKeyWindow) {
                    window = w;
                    break;
                }
            }

            if (window) break;
        }

        if (!window) return;

        UILabel *label = [[UILabel alloc]
            initWithFrame:CGRectMake(0, 80, window.bounds.size.width, 45)];

        label.text = @"@Ryumax1";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:24.0];
        label.textColor = [UIColor systemPurpleColor];

        [window addSubview:label];
    });
}
