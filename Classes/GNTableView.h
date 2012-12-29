//
//  GNTableView.h
//  GuessingNumber
//
//  Created by acelan on 2011/5/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GNTableView;

@protocol GNTableViewDelegate

- (NSString*)tableName:(GNTableView*)requestor;

@end

@interface GNTableView : UITableViewController {
	NSMutableArray* listOfTable;
}

- (void) addAnItem:(id)item;

@property (assign) id <GNTableViewDelegate> delegate;

@end
