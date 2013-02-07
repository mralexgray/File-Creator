#import <Foundation/Foundation.h>

@interface FCFileCreator : NSObject

/** @name Creating files */
/**
 * The low level call for creating files
 */
-(void)createFile:(NSString *)filename atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes;
/**
 * Create a file with the desired extension
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes;

/**
 * @param pboard The pasteboard with the selection
 * @returns The directory of the selected files
 */
-(NSString *)directoryFromPasteboard:(NSPasteboard *)pboard;
/**
 *Create a file at the path of the selected files
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard contents:(NSData *)contents attributes:(NSDictionary *)attributes;
/**
 * Same as createFile:withExtension:pasteboard:contents:attributes: but with predefined values
 * @param pboard The pasteboard with the selection
 * @sa createFile:withExtension:pasteboard:contents:attributes:
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard;
/**
 * Create a script file
 * Depending on the user defaults it will give execution permissions
 * and add a shebang.
 * @param pboard The pasteboard with the selection
 * @see createFile:withExtension:pasteboard:contents:attributes:
 * @warning The shebang format is not defined, for now it should start by "#!", but it could change in the future
 */
-(void)createScriptFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard shebang:(NSString *)shebang;

/** @name Services */
/** Create a file with "txt" extension
 * @param pboard The pasteboard with the selection
 */
-(void)createFile:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;
/** Create a script with "py" extension
 * @param pboard The pasteboard with the selection
 */
-(void)createPythonScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;
/** Create a script with "sh" extension
 * @param pboard The pasteboard with the selection
 */
-(void)createShellScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;

@end
