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
	//NSStatusBar *stat=[NSStatusBar sys]
	NSStatusBar *bar = [NSStatusBar systemStatusBar];

	statusItem= [bar statusItemWithLength:NSVariableStatusItemLength];
	//[theItem retain];

    //[theItem setTitle: @"File Creator"];
	NSImage *icon=[NSApp applicationIconImage];
	[icon setSize:NSMakeSize(16,16)];
	[statusItem setImage:icon];
    [statusItem setHighlightMode:YES];
    [statusItem setMenu:statusMenu];
}

-(IBAction)showPreferences:(id)sender
{
	// TODO: Fix when the window has already benn closed once
	if(![preferencesWindow isVisible] )
        [preferencesWindow makeKeyAndOrderFront:nil];
}
-(IBAction)quitApp:(id)sender
{
	[NSApp terminate:nil];
}
- (IBAction)openHomepage:(id)sender
{
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://jaimemf.bitbucket.org"]];
}

- (IBAction)shellSelectorSelected:(id)sender {
	[[NSUserDefaults standardUserDefaults] setObject:[shellSelector titleOfSelectedItem] forKey:UDKdefaultShell];
}

@end
