//
//  CounterBeansAppDelegate.m
//  CounterBeans
//
//  Created by Ali Rizvi on 3/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CounterBeansAppDelegate.h"

@implementation CounterBeansAppDelegate

@synthesize counterLabel = _counterLabel;
@synthesize window=_window;
@synthesize targetCount = _targetCount;
@synthesize lastCount = _lastCount;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  targetCountValue = 33;  
  countValue = 0;
  self.targetCount.text = [NSString stringWithFormat:@"%d", targetCountValue];

  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
    [_counterLabel release];
    [_targetCount release];
    [_lastCount release];
    [super dealloc];
}

- (IBAction)countUpButton:(id)sender {
  NSLog(@"count up pressed");
  countValue++;
  int difference = targetCountValue - countValue;
  switch (difference) {
    case 0:
      [self alertDone];
      break;
    case 3:
      [self vibrateOrBeep];
      break;
    default:
      break;
  }
   [_counterLabel setText:[NSString stringWithFormat:@"%d", countValue]];
}

- (void)vibrateOrBeep {
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)alertDone {
  UIAlertView *alert = [[UIAlertView alloc]
                        initWithTitle:@"Target Achieved"
                        message:nil
                        delegate:nil
                        cancelButtonTitle:nil
                        otherButtonTitles:@"OK", nil];
  [alert show];
  [alert autorelease];
}

- (IBAction)resetCountButton:(id)sender {
  NSLog(@"reset button pressed");
  self.lastCount.text = self.counterLabel.text;
  countValue = 0;
  [_counterLabel setText:[NSString stringWithFormat:@"%d", countValue]];

}
- (IBAction)saveTargetCount:(id)sender {
  targetCountValue = [self.targetCount.text intValue];
  [self resetCountButton:self];
  [self.targetCount resignFirstResponder];
}
@end
