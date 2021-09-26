#import "RustypipeuinativePlugin.h"
#if __has_include(<rustypipeuinative/rustypipeuinative-Swift.h>)
#import <rustypipeuinative/rustypipeuinative-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rustypipeuinative-Swift.h"
#endif

@implementation RustypipeuinativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRustypipeuinativePlugin registerWithRegistrar:registrar];
}
@end
