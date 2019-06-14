#import "UikitBycnPlugin.h"
#import <uikit_bycn/uikit_bycn-Swift.h>

@implementation UikitBycnPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUikitBycnPlugin registerWithRegistrar:registrar];
}
@end
