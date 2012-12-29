//
//  GuessingRecord.h
//  GuessingNumber
//
//  Created by acelan on 2011/4/26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GuessingRecord : NSObject {
	NSString *number;
	NSString *result;
}

@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *result;

- (id)initWithNumber:(NSString*)aNumber andResult:(NSString*)anResult;
@end
