#import <Foundation/Foundation.h>

/**
 FCFileCreator listen for services messages and creates the files at the selected paths.
 */
@interface FCFileCreator : NSObject

/** @name Creating files */
/**
 * The lower level call for creating files
 * @param filename The file name (with an optional extension).
 * @param path The directory where the file will be created.
 * @param contents The file contents.
 * @param attributes The file attributes.
 */
-(void)createFile:(NSString *)filename atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes;
/**
 * Create a file with the desired extension
 * @param filename The file name (without extension).
 * @param extension the file extension, without point, e.g: "txt". If you dont't want an extension use @"" or nil.
 * @param path The directory where the file will be created.
 * @param contents The file contents.
 * @param attributes The file attributes.
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension atPath:(NSString *)path contents:(NSData *)contents attributes:(NSDictionary *)attributes;

/**
 * @param pboard The pasteboard with the selection.
 * @returns The directory of the selected files
 */
-(NSString *)directoryFromPasteboard:(NSPasteboard *)pboard;
/**
 *Create a file at the path of the selected files
 * @param filename The file name (without extension).
 * @param pboard The pasteboard with the selection.
 * @param extension the file extension, without point, e.g: "txt".
 * @param contents The file contents.
 * @param attributes The file attributes.
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard contents:(NSData *)contents attributes:(NSDictionary *)attributes;
/**
 * Same as createFile:withExtension:pasteboard:contents:attributes: but with predefined values
 * @param filename The file name (without extension).
 * @param extension the file extension, without point, e.g: "txt".
 * @param pboard The pasteboard with the selection.
 * @sa createFile:withExtension:pasteboard:contents:attributes:
 */
-(void)createFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard;
/**
 * Create a script file
 * Depending on the user defaults it will give execution permissions
 * and add a shebang.
 * @param filename The file name (without extension).
 * @param extension the file extension, without point, e.g: "txt".
 * @param pboard The pasteboard with the selection.
 * @param shebang The shebang needed for running the scriot, should start with `#!`. For example: `#!/usr/bin/python`.
 * @see createFile:withExtension:pasteboard:contents:attributes:
 * @warning The shebang format is not defined, for now it should start by "#!", but it could change in the future
 */
-(void)createScriptFile:(NSString *)filename withExtension:(NSString *)extension pasteboard:(NSPasteboard *)pboard shebang:(NSString *)shebang;

/** @name Services */
/** Create a file with "txt" extension
 * @param pboard The pasteboard with the selection.
 * @param data Some data
 * @param error Error
 */
-(void)createFile:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;
/** Create a script with "py" extension
 * @param pboard The pasteboard with the selection.
 * @param data Some data
 * @param error Error
 */
-(void)createPythonScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;
/** Create a script with "sh" extension
 * @param pboard The pasteboard with the selection.
 * @param data Some data
 * @param error Error
 */
-(void)createShellScript:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)error;

@end
