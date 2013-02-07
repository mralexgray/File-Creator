#import <Cocoa/Cocoa.h>

#import "FCFileCreator.h"

/**
 The App delegate for File Creator
 */
@interface FCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *preferencesWindow;
/// The status menu item for the app
@property (strong) NSStatusItem *statusItem;
/// The status menu, needed since it has no gui when the application starts
@property (assign)IBOutlet NSMenu *statusMenu;
/// The objects that takes care of the services calls and the creation of files
@property FCFileCreator *fileCreator;

/** Show the preferences
 * @bug When the window has already been closed once, the call fails.
 * @param sender The sender of the message.
 */
-(IBAction)showPreferences:(id)sender;
-(IBAction)quitApp:(id)sender;
/** Open the homepage 
 * @param sender The sender of the message.
 */
-(IBAction)openHomepage:(id)sender;

@end
