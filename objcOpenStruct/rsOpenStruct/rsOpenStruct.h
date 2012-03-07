//
//  rsOpenStruct.h
//  
//
//  Created by Radif Sharafullin on 3/7/12.
//  Copyright 2011 Radif Sharafullin. All rights reserved.
//
// Released under MIT license

/*!
 Synopsis:
 Dynamic data structure, similar to OpenStruct in ruby.
 Allows any setter and getter methods during runtime.
 Adds syntactic sugar to Objective-c
 Convenient for keeping values and work with databases
 
 Example:
 
 id book=[rsOpenStruct new];
 [book setTitle:@"hello world"];
 [book setAuthor:@"Me"];
 [book setCurrentYear:[NSNumber numberWithInt:2011]];
 //you can invent methods on the fly....
 
 
 NSLog(@"%@",[book title]);
 NSLog(@"%@",[book author]);
 NSLog(@"%@",[book currentYear]);
 //returns nil if the setter wasn't called
 [book release];
 
 Output:
 hello world
 Me
 2011
 
 Caveats: you will get compiler warnings
 If they bother you, you can declare the methods using "@interface rsOpenStruct (PrivateMethods)" or "@interface NSObject (MyInformalProtocol)" if casting from id in your module or change the warning options of your project :)
 */

#import <Foundation/Foundation.h>


@interface rsOpenStruct : NSObject {
	NSMutableDictionary * dictionary;
}
@property (nonatomic, readonly) NSMutableDictionary * dictionary;
@end
