//
//  GuessingNumberViewController.m
//  GuessingNumber
//
//  Created by acelan on 2011/5/2.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GuessingNumberViewController.h"
#import "GuessingRecord.h"

@implementation GuessingNumberViewController

@synthesize userText, computerTVC, userTVC;

- (GuessingNumberBrain *)brain
{
	if (!brain) {
		brain = [[GuessingNumberBrain alloc] init];
	}
	return brain;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.userTVC.delegate = userTVC;
	self.computerTVC.delegate = computerTVC;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.userTVC = nil;
	self.computerTVC = nil;
}


- (void)dealloc {
    [super dealloc];
	self.userTVC = nil;
	self.computerTVC = nil;
	[brain release];
}


- (IBAction)exitPressed:(UIButton *)sender
{
}

- (IBAction)okPressed:(UIButton *)sender
{
	if ([userText isEnabled]) {
		NSString *guessedNumber = [userText text];
		if ([guessedNumber isEqualToString:@""]) {
			return;
		}
	
		NSString *result = [[self brain] userGuessingANumber:guessedNumber];
		GuessingRecord *aRecord = [[GuessingRecord alloc] initWithNumber:guessedNumber andResult:result];
		NSLog(@"okPressed: number: %@, result: %@", guessedNumber, result);
		[userTVC addAnItem:aRecord];
		
		[userText setEnabled:FALSE];
		[textInputA setEnabled:TRUE];
		[textInputB setEnabled:TRUE];
		
		computerGuessedNumber.text = [[self brain] computerGuessingANumber];
		
		userText.text = @"";
	} else {
		NSString *guessedNumber = [computerGuessedNumber text];
		
		[[self brain] userRespond:[[textInputA text] integerValue]	andB:[[textInputB text] integerValue]];
		
		NSString *result = [NSString stringWithFormat:@"%@A%@B", [textInputA text], [textInputB text]];
		GuessingRecord *aRecord = [[GuessingRecord alloc] initWithNumber:guessedNumber andResult:result];
		NSLog(@"okPressed: number: %@, result: %@", guessedNumber, result);
		[computerTVC addAnItem:aRecord];
		
		[userText setEnabled:TRUE];
		[textInputA setEnabled:FALSE];
		[textInputB setEnabled:FALSE];
		computerGuessedNumber.text = @"";
		textInputA.text = @"";
		textInputB.text = @"";
	}

	
/*
	///////////////
    NSString *msg = [NSString stringWithFormat:@"The number you input is: %@\nand the result is: "
					 , guessedNumber
					 , [brain userGuessingANumber:guessedNumber]]; 
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Captain's Orders"
                                                    message:msg
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil]; 
    [alert show]; 
    [alert release]; 
	////////////////
*/
}

@end
