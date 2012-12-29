//
//  GNTableView.m
//  GuessingNumber
//
//  Created by acelan on 2011/5/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GNTableView.h"
#import "GuessingRecord.h"

@implementation GNTableView

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableArray *)listOfTable
{
	if (!listOfTable) {
		listOfTable = [[NSMutableArray alloc] init];
	}
	return listOfTable;
}

- (void) addAnItem:(id)item
{
	[[self listOfTable] addObject:item];
	NSLog(@"addAnItem: list count: %d", listOfTable.count);
	[[self tableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	NSLog(@"numberOfSectionsInTableView");
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	NSLog(@"numberOfRowsInSection: list count: %d", listOfTable.count);
    return [[self listOfTable] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"cellForRowAtIndexPath");
    
	static NSString *CellIdentifier = @"CellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
	}

	 GuessingRecord *aRecord = [[self listOfTable] objectAtIndex:[indexPath row]];
	 cell.textLabel.text = [aRecord number];
	 cell.detailTextLabel.text = [aRecord result];

	// Set up the cell
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSLog(@"table name: %@", [self.delegate tableName:self]);
	return [self.delegate tableName:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

- (void)dealloc {
    [super dealloc];
}


@end
