#import <Cocoa/Cocoa.h>

#define UDKoverwriteFiles @"overwriteFiles"
#define UDKaddShebang @"addShebang"
#define UDKmakeExecutableScripts @"makeExecutableScripts"
#define UDKaddSHextension @"addSHextension"
#define UDKdefaultShell @"defaultShell"

int main(int argc, char *argv[])
{
	[[NSUserDefaults standardUserDefaults]
						registerDefaults:@{UDKoverwriteFiles:@NO,
										   UDKaddShebang:@NO,
										   UDKmakeExecutableScripts:@NO,
										   UDKaddSHextension:@YES,
										   UDKdefaultShell:@"/bin/bash"}];
	return NSApplicationMain(argc, (const char **)argv);
}
