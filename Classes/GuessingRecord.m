//
//  GuessingRecord.m
//  GuessingNumber
//
//  Created by acelan on 2011/4/26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GuessingRecord.h"


@implementation GuessingRecord
@synthesize number, result;

- (id)initWithNumber:(NSString*)aNumber andResult:(NSString*)anResult
{
	self.number = aNumber;
	self.result = anResult;
	return self;
}
@end
