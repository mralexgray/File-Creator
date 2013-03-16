#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
	[[NSUserDefaults standardUserDefaults]
	 registerDefaults:
	 [NSDictionary dictionaryWithObjectsAndKeys:
	  @"0",UDKoverwriteFiles,
	  @"1", UDKinitializeHTML,
	  @"0",UDKaddShebang,
	  @"0",UDKmakeExecutableScripts,
	  @"1",UDKaddSHextension,
	  @"/bin/bash",UDKdefaultShell,
	nil]];
	
	return NSApplicationMain(argc, (const char **)argv);
}
