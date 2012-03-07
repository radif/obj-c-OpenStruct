//
//  rsOpenStruct.m
//  
//
//  Created by Radif Sharafullin on 3/7/12.
//  Copyright 2011 Radif Sharafullin. All rights reserved.
//
// Released under MIT license

#import "rsOpenStruct.h"
#import <objc/runtime.h>
void dictionaryMethodSet(id obj, SEL _cmd, id item){
	//define get method
	NSString * selector=NSStringFromSelector(_cmd);
	selector=[selector stringByReplacingOccurrencesOfString:@"set" withString:@""];
	selector=[selector stringByReplacingOccurrencesOfString:@":" withString:@""];
	selector=[NSString stringWithFormat:@"%@%@",[[selector substringToIndex:1] lowercaseString],[selector substringFromIndex:1]];
	
	if (item) 
		[[obj dictionary] setObject:item forKey:selector];
	else
		if([[obj dictionary] objectForKey:selector]) [[obj dictionary] removeObjectForKey:selector];
	

	
	
}
id dictionaryMethodGet(id obj, SEL _cmd){
	return [[obj dictionary] objectForKey:NSStringFromSelector(_cmd)];
}
@implementation rsOpenStruct
@synthesize  dictionary;
-(id)init{
	self=[super init];
	dictionary=[NSMutableDictionary new];
	return self;
}
+(BOOL)resolveInstanceMethod:(SEL)aSEL{
	
	NSString *selector=NSStringFromSelector(aSEL);
	if ([selector hasPrefix:@"set"]) {
		//define set method
		class_addMethod([self class],aSEL,(IMP)dictionaryMethodSet,"v@:@");
		
	}	else {
		SEL getSelector=NSSelectorFromString(selector);
		class_addMethod([self class],getSelector,(IMP)dictionaryMethodGet,"@@:");
	}
	return TRUE;
}

-(void)dealloc{
	[dictionary release];
	[super dealloc];
}
@end
