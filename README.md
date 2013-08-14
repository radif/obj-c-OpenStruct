obj-c-OpenStruct
================

Ruby Open Struct implementation in objective-c
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
