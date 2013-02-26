#import "FCFileCreator.h"

#define UDKoverwriteFiles @"overwriteFiles"
#define UDKaddShebang @"addShebang"
#define UDKmakeExecutableScripts @"makeExecutableScripts"
#define UDKaddSHextension @"addSHextension"
#define UDKdefaultShell @"defaultShell"

static NSString *defaultFilename=@"empty";

@implementation FCFileCreator

-(void)createFile:(NSString *)filename atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes
{
	[[NSFileManager defaultManager] createFileAtPath:[path stringByAppendingPathComponent:filename] contents:contents attributes:attributes];
}
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes
{
	NSString *fullFilename=filename;
	if ((extension!=nil) && ([extension isEqualToString:@""]==NO)) fullFilename=[filename stringByAppendingPathExtension:extension];
	[self createFile:fullFilename atPath:path contents:contents attributes:attributes];
}

-(NSString *)directoryFromPasteboard:(NSPasteboard *)pboard
{
	NSString *dir=nil;
	if([[pboard types] containsObject:NSFilenamesPboardType])
	{
		NSArray *filenames=[pboard propertyListForType:NSFilenamesPboardType];
		dir=[(NSString *)[filenames objectAtIndex:0] stringByDeletingLastPathComponent];
	}
	return dir;
}
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard contents:(NSData *)contents attributes:(NSDictionary *)attributes
{
	NSString *dir=[self directoryFromPasteboard:pboard];
	if (dir) {
		[self createFile:filename withExtension:extension atPath:dir contents:contents attributes:attributes];
	}
}
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard
{
	[self createFile:filename withExtension:extension pasteboard:pboard contents:nil attributes:nil];
}
-(void)createScriptFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard shebang:(NSString *)shebang
{
	NSData *fileContents=nil;
	NSMutableDictionary *attr=[NSMutableDictionary dictionary];
	if ([[NSUserDefaults standardUserDefaults] boolForKey:UDKaddShebang]) {
		// NSUnicodeStringEncoding cause python idle to not open the file unless you tell it it uses utf-16
		fileContents=[shebang dataUsingEncoding:NSUTF8StringEncoding];
	}
	if ([[NSUserDefaults standardUserDefaults] boolForKey:UDKmakeExecutableScripts]) {
		[attr setValue:[NSNumber numberWithInt:0755] forKey:NSFilePosixPermissions];
	}
	[self createFile:filename withExtension:extension pasteboard:pboard contents:fileContents attributes:attr];
}

#pragma mark Services
-(void)createFile:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error
{
	[self createFile:defaultFilename withExtension:@"txt" pasteboard:pboard];
}
-(void)createHTMLfile:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error
{
	NSString *htmlContent=
@"<!DOCTYPE html>\n\
<html>\n\
	<head>\n\
		<meta charset=\"utf-8\">\n\
		<title>Empty</title>\n\
	</head>\n\
	<body>\n\
		Write here\n\
	</body>\n\
</html>";
	NSData *htmlData=[htmlContent dataUsingEncoding:NSUTF8StringEncoding];
	[self createFile:defaultFilename withExtension:@"html" pasteboard:pboard contents:htmlData attributes:nil];
}

-(void)createPythonScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error
{
	[self createScriptFile:defaultFilename withExtension:@"py" pasteboard:pboard shebang:@"#!/usr/bin/env python"];
}
-(void)createRubyScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString *__autoreleasing *)error
{
	[self createScriptFile:defaultFilename withExtension:@"rb" pasteboard:pboard shebang:@"#!/usr/bin/env ruby"];
}
-(void)createPerlScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString *__autoreleasing *)error
{
	[self createScriptFile:defaultFilename withExtension:@"pl" pasteboard:pboard shebang:@"#!/usr/bin/env perl"];
}
-(void)createShellScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error
{
	NSString *ext=nil;
	NSString *shebang=[NSString stringWithFormat:@"#!%@",[[NSUserDefaults standardUserDefaults] stringForKey:UDKdefaultShell],nil];
	if([[NSUserDefaults standardUserDefaults] boolForKey:UDKaddSHextension]) ext=@"sh";
	[self createScriptFile:defaultFilename withExtension:ext pasteboard:pboard shebang:shebang];
}

@end
