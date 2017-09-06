
#import "CTContentBlogController.h"

static NSString * const kActionRead = @"Read";
static NSString * const kActionKeep = @"Keep";

@interface CTContentBlogController ()

@end

@implementation CTContentBlogController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configureViewForContent:(UNNotificationContent *)content {
    NSLog(@"Content BlogPost: %@", content);
    NSLog(@"Options: %@", self.options);
}

- (UNNotificationContentExtensionResponseOption)handleAction:(NSString *)action {
    if ([action isEqualToString:kActionRead]) {
        [[self getParentViewController] openUrl:[NSURL new]];
        return UNNotificationContentExtensionResponseOptionDismiss;
    }
    return UNNotificationContentExtensionResponseOptionDismissAndForwardAction;
}

@end
