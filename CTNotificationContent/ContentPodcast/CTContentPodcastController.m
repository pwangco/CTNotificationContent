
#import "CTContentPodcastController.h"
static NSString * const kActionPlay = @"Play";
static NSString * const kActionKeep = @"Keep";

@interface CTContentPodcastController () {
    NSDictionary *model;
}

@end

@implementation CTContentPodcastController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configureViewForContent:(UNNotificationContent *)content {
    NSLog(@"Options: %@", self.options);
    
    NSDictionary *userInfo = content.userInfo;
    NSDictionary *data = [userInfo objectForKey:@"d"];
    if (data && [data isKindOfClass:[NSString class]]) {
        NSString *_jsonString = (NSString *) data;
        NSData *_data = [_jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error;
        data = [NSJSONSerialization JSONObjectWithData:_data options:0 error:&error];
        
        if (error) {
            data = nil;
        }
    }
    model = [data objectForKey:@"m"];
    if (!model || ![model isKindOfClass:[NSDictionary class]]) {
        model = nil;
    }
    
     NSLog(@"Content Podcast model: %@", model);
}

- (UNNotificationContentExtensionResponseOption)handleAction:(NSString *)action {
    if ([action isEqualToString:kActionPlay]) {
        [self launchHostApp];
        return UNNotificationContentExtensionResponseOptionDismiss;
    }
    return UNNotificationContentExtensionResponseOptionDismissAndForwardAction;
}


-(void)launchHostApp {
    if (!model) {
        return;
    }
    
    NSString *customScheme;
    if(self.options) {
        customScheme = [self.options objectForKey:@"customScheme"];
    }
    
    NSString *cUID = [model objectForKey:@"c_uid"];
    NSString *objectType = [model objectForKey:@"object_type"];
    NSString *objectId = [model objectForKey:@"id"];
    
    if(!cUID || !objectId || !objectType) return;
    
    NSString *path = [NSString stringWithFormat:@"celebs/%@/%@/%@",cUID, objectType, objectId];
    NSString *urlString = [NSString stringWithFormat:@"%@://%@", customScheme, path];
    NSURL *url = [NSURL URLWithString:urlString];
    [[self getParentViewController] openUrl:url];
}

@end
