#import <Cocoa/Cocoa.h>

#define UDKoverwriteFiles @"overwriteFiles"
#define UDKaddShebang @"addShebang"
#define UDKmakeExecutableScripts @"makeExecutableScripts"
#define UDKaddSHextension @"addSHextension"

int main(int argc, char *argv[])
{
	[[NSUserDefaults standardUserDefaults]
						registerDefaults:@{UDKoverwriteFiles:@NO,
										   UDKaddShebang:@NO,
										   UDKmakeExecutableScripts:@NO,
										   UDKaddSHextension:@YES}];
	return NSApplicationMain(argc, (const char **)argv);
}
