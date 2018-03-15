@import CoreServices;
@import Foundation;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            return 0;
        }

        NSString * const path = [NSString stringWithUTF8String:argv[1]];
        NSURL * const url = [NSURL fileURLWithPath:path];
        FSRef fsref;
        CFURLGetFSRef((__bridge CFURLRef)url, &fsref);

        NSDictionary * const environment = @{};
        const LSApplicationParameters params = {
            .application = &fsref,
            .environment = (__bridge CFDictionaryRef)environment
        };
        ProcessSerialNumber psn;
        return LSOpenApplication(&params, &psn);
    }
}

#pragma clang diagnostic pop
