#import <Cocoa/Cocoa.h>

#define UDKoverwriteFiles @"overwriteFiles"
#define UDKaddShebang @"addShebang"
#define UDKmakeExecutableScripts @"makeExecutableScripts"
#define UDKaddSHextension @"addSHextension"
#define UDKdefaultShell @"defaultShell"

int main(int argc, char *argv[])
{
	[[NSUserDefaults standardUserDefaults]
	 registerDefaults:
	 [NSDictionary dictionaryWithObjectsAndKeys:
	  @"0",UDKoverwriteFiles,
	  @"0",UDKaddShebang,
	  @"0",UDKmakeExecutableScripts,
	  @"1",UDKaddSHextension,
	  @"/bin/bash",UDKdefaultShell,
	nil]];
	
	return NSApplicationMain(argc, (const char **)argv);
}
