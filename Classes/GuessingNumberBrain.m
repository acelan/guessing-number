//
//  GuessingNumberBrain.m
//  GuessingNumber
//
//  Created by acelan on 2011/4/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GuessingNumberBrain.h"


@implementation GuessingNumberBrain
@synthesize resolutionSet, theNumberInComputerMind;

#define	NUMS	4
#define MAX_NUM	9876
#define MIN_NUM	123

- (NSMutableArray *)resolutionSet
{
	if (!resolutionSet) {
		resolutionSet = [[NSMutableArray alloc] init];
	}
	return resolutionSet;
}

- (BOOL)isAValidNumber:(NSInteger)num
{
	if ( num > MAX_NUM || num < MIN_NUM) {
		return NO;
	}
	
	NSString *numString = [NSString stringWithFormat:@"%04d",num];		// NUMS
		for( int i = 0; i < NUMS; i++)
		for( int j = i + 1; j < NUMS; j++)
			if( [numString UTF8String][ i] == [numString UTF8String][ j])
				return NO;
	
	return YES;
}

- (void)queryAB:(NSString*)num1 andNum2:(NSString*)num2 resultA:(int*)a andResultB:(int*)b
{
	*a= 0, *b= 0;
	
	for( int i= 0; i< NUMS; i++)
		if( [num1 UTF8String][ i] == [num2 UTF8String][ i])
			(*a)++;
	
	for( int i= 0; i< NUMS; i++)
		for( int j= 0; j< NUMS; j++)
			if( [num1 UTF8String][ i] == [num2 UTF8String][ j])
				(*b)++;
	*b-= *a;
	NSLog(@"num1= %@, num2= %@ - a= %d, b= %d", num1, num2, *a, *b);	
}

- (GuessingNumberBrain*) init
{
	for( NSInteger i = MIN_NUM ; i <= MAX_NUM ; i++)
	{
		if ( [self isAValidNumber:i] == YES) {
			[[self resolutionSet] addObject:[NSString stringWithFormat:@"%4d",i]];
//			NSLog(@"%d", i);
		}
	}
	
	NSInteger index = arc4random() % [resolutionSet count];
	theNumberInComputerMind = [resolutionSet objectAtIndex:index];
	NSLog(@"theNumberInComputerMind = %@", theNumberInComputerMind);
	
	return self;
}

- (NSString *)userGuessingANumber:(NSString *)number
{
	int a, b;
	[self queryAB:number andNum2:theNumberInComputerMind resultA:&a andResultB:&b];
//	NSLog(@"a= %d, b= %d", a, b);
	
	return [NSString stringWithFormat:@"%dA%dB", a, b];
}

- (NSString *)computerGuessingANumber
{
	NSInteger index = arc4random() % [resolutionSet count];
	guessedNumber = [resolutionSet objectAtIndex:index];
	
	return guessedNumber;
}

- (void)updateResolutionSetWithA:(NSInteger)inputedA andB:(NSInteger)inputedB
{
	int a, b;
	NSMutableArray *removeSet = [[NSMutableArray alloc] init];
	
	for (NSString *resolution in resolutionSet) {
		[self queryAB:guessedNumber andNum2:resolution resultA:&a andResultB:&b];
		if ( a != inputedA && b != inputedB) {
			[removeSet addObject:resolution];
		}
	}
	
	for (NSString *resolution in removeSet) {
		[resolutionSet removeObject:resolution];
	}
	
	NSLog(@"resolutionSet count = %d", [resolutionSet count]);
	
	[removeSet release];
}

- (NSInteger)userRespond:(NSInteger)a andB:(NSInteger)b
{
	[self updateResolutionSetWithA:a andB:b];
	return 0;
}

@end
