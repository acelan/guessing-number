//
//  GuessingNumberViewController.h
//  GuessingNumber
//
//  Created by acelan on 2011/5/2.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNUserTableViewController.h"
#import "GNComputerTableViewController.h"
#import "GuessingNumberBrain.h"

@interface GuessingNumberViewController : UIViewController {
	IBOutlet GNComputerTableViewController *computerTVC;
	IBOutlet GNUserTableViewController *userTVC;
	IBOutlet UITextField *userText;
	IBOutlet UITextField *computerGuessedNumber;
	IBOutlet UITextField *textInputA;
	IBOutlet UITextField *textInputB;
//	GNUserTableViewController *userTVC;
//	GNComputerTableViewController *computerTVC;
	GuessingNumberBrain *brain;
}

@property (retain) IBOutlet UITextField *userText;
@property (retain) IBOutlet GNComputerTableViewController *computerTVC;
@property (retain) IBOutlet GNUserTableViewController *userTVC;
- (IBAction)exitPressed:(UIButton *)sender;
- (IBAction)okPressed:(UIButton *)sender;

@end

