
#import "CTContentBlogController.h"

static NSString * const kActionRead = @"Read";
static NSString * const kActionKeep = @"Keep";

@interface CTContentBlogController ()

@end

@implementation CTContentBlogController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)configureViewForContent:(UNNotificationContent *)content {
    NSLog(@"Content Blog: %@", content);
}

- (UNNotificationContentExtensionResponseOption)handleAction:(NSString *)action {
    if ([action isEqualToString:kActionRead]) {
        // do something
        return UNNotificationContentExtensionResponseOptionDismiss;
    }
    return UNNotificationContentExtensionResponseOptionDismissAndForwardAction;
}

@end
