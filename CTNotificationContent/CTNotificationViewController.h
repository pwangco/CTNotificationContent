
#import <UIKit/UIKit.h>

@class UNNotification;

typedef NS_ENUM(NSInteger, CTNotificationContentType) {
    CTNotificationContentTypeContentSlider = 0,
    CTNotificationContentTypeContentBlogPost,
    CTNotificationContentTypeContentPodcast
};

@interface CTNotificationViewController : UIViewController

@property(nonatomic, assign) CTNotificationContentType contentType;
@property(nonatomic, retain, nullable) NSDictionary *options;

- (void)didReceiveNotification:(UNNotification * _Nonnull)notification;

- (void)userDidPerformAction:(NSString * _Nonnull)action withProperties:(NSDictionary * _Nullable)properties;  // implement in your subclass to get user event type data

- (void)openUrl:(NSURL * _Nonnull)url; // convenience method

@end
