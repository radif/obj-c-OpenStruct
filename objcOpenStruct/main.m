//
//  main.m
//  objcOpenStruct
//
//  Created by Radif Sharafullin on 3/7/12.
//  Copyright (c) 2012 Radif Sharafullin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rsOpenStruct.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        id book=[rsOpenStruct new];
        //you can invent setter methods on the fly....
        [book setTitle:@"hello world"];
        [book setAuthor:@"Me"];
        [book setCurrentYear:[NSNumber numberWithInt:2011]];
        
        
        
        
        //you can invent getter methods on the fly....
        NSLog(@"%@",[book title]);
        NSLog(@"%@",[book author]);
        NSLog(@"%@",[book currentYear]);
        //returns nil if the setter wasn't called
        [book release];
        
    }
    return 0;
}

