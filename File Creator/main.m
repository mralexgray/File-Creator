#import <Cocoa/Cocoa.h>

#define UDKoverwriteFiles @"overwriteFiles"
#define UDKaddShebang @"addShebang"
#define UDKmakeExecutableScripts @"makeExecutableScripts"

int main(int argc, char *argv[])
{
	[[NSUserDefaults standardUserDefaults]
						registerDefaults:@{UDKoverwriteFiles:@NO,
										   UDKaddShebang:@NO,
										   UDKmakeExecutableScripts:@NO}];
	return NSApplicationMain(argc, (const char **)argv);
}
