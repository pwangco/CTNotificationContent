
#import "CTContentPodcastController.h"
static NSString * const kActionPlay = @"Play";
static NSString * const kActionKeep = @"Keep";

@interface CTContentPodcastController ()

@end

@implementation CTContentPodcastController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configureViewForContent:(UNNotificationContent *)content {
    NSLog(@"Content Podcast: %@", content);
}

- (UNNotificationContentExtensionResponseOption)handleAction:(NSString *)action {
    if ([action isEqualToString:kActionPlay]) {
        [[self getParentViewController] openUrl:[NSURL new]];
        return UNNotificationContentExtensionResponseOptionDismiss;
    }
    return UNNotificationContentExtensionResponseOptionDismissAndForwardAction;
}

@end
