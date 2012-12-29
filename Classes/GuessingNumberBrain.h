//
//  GuessingNumberBrain.h
//  GuessingNumber
//
//  Created by acelan on 2011/4/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessingNumberBrain : NSObject {
	NSMutableArray *resolutionSet;
	NSString *theNumberInComputerMind;
	NSString *guessedNumber;
}

@property (retain) NSMutableArray *resolutionSet;
@property (retain) NSString *theNumberInComputerMind;

- (NSString *)userGuessingANumber:(NSString *)guessedNumber;
- (NSString *)computerGuessingANumber;
- (NSInteger)userRespond:(NSInteger)a andB:(NSInteger)b;

@end
