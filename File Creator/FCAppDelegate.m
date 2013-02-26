#import "FCAppDelegate.h"

#define UDKdefaultShell @"defaultShell"

@implementation FCAppDelegate

@synthesize statusItem,statusMenu,fileCreator,preferencesWindow,shellSelector;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	[shellSelector selectItemWithTitle:[[NSUserDefaults standardUserDefaults] stringForKey:UDKdefaultShell]];

	self.fileCreator=[FCFileCreator new];
	[NSApp setServicesProvider:self.fileCreator];
	NSStatusBar *bar = [NSStatusBar systemStatusBar];

	statusItem= [bar statusItemWithLength:NSVariableStatusItemLength];

	NSImage *icon=[NSApp applicationIconImage];
	[icon setSize:NSMakeSize(16,16)];
	[statusItem setImage:icon];
    [statusItem setHighlightMode:YES];
    [statusItem setMenu:statusMenu];
}

-(IBAction)showPreferences:(id)sender
{
	if(![preferencesWindow isVisible] )
        [preferencesWindow makeKeyAndOrderFront:nil];
}
- (IBAction)openHomepage:(id)sender
{
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://jaimemf.bitbucket.org/File-Creator/"]];
}
- (IBAction)openAuthorsPage:(id)sender
{
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://jaimemf.bitbucket.org"]];
}

- (IBAction)shellSelectorSelected:(id)sender {
	[[NSUserDefaults standardUserDefaults] setObject:[shellSelector titleOfSelectedItem] forKey:UDKdefaultShell];
}

@end
