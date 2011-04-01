//
//  CounterBeansAppDelegate.h
//  CounterBeans
//
//  Created by Ali Rizvi on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterBeansAppDelegate : NSObject <UIApplicationDelegate> {
  UILabel *_counterLabel;
  int count;
}

- (IBAction)countUpButton:(id)sender;
- (IBAction)resetCountButton:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
