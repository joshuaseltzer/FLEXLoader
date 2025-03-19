//
//  SSFLEXLoaderLoader.xm
//
//
//
//

#import <Foundation/Foundation.h>
#include <dlfcn.h>

%ctor {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.joeyio.FLEXLoader.plist"];
    if ([[prefs objectForKey:[NSString stringWithFormat:@"FLEXLoaderEnabled-%@", [[NSBundle mainBundle] bundleIdentifier]]] boolValue]) {
        NSString *libraryPath = @"/Library/Application Support/FLEXLoader/FLEXDylib.dylib";
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
            dlopen([libraryPath UTF8String], RTLD_NOW);
        }
    }
}
