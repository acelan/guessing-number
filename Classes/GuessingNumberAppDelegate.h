//
//  GuessingNumberAppDelegate.h
//  GuessingNumber
//
//  Created by acelan on 2011/5/2.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuessingNumberViewController;

@interface GuessingNumberAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GuessingNumberViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GuessingNumberViewController *viewController;

@end

