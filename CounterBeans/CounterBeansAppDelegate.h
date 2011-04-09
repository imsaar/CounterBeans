//
//  CounterBeansAppDelegate.h
//  CounterBeans
//
//  Created by Ali Rizvi on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface CounterBeansAppDelegate : NSObject <UIApplicationDelegate> {
  UILabel *_counterLabel;
  int countValue;
  int targetCountValue;
  UITextField *_targetCount;
  UILabel *_lastCount;
}

- (IBAction)countUpButton:(id)sender;
- (IBAction)resetCountButton:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITextField *targetCount;
@property (nonatomic, retain) IBOutlet UILabel *lastCount;
- (IBAction)saveTargetCount:(id)sender;
- (void)alertDone;
- (void)vibrateOrBeep;

@end
