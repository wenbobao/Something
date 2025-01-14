//
//  AppDelegate.m
//
//  Created by Mohd Iftekhar Qurashi on 01/07/13.

//将IQKeyboardManager 和 IQSegmentedNextPrevious类文件加进项目中。在AppDelegate文件中写下以下一行代码：
//[IQKeyBoardManager installKeyboardManager];
//搞定！
//也可以开启或者关闭keyboard avoiding功能：
//[IQKeyBoardManager enableKeyboardManger];
//[IQKeyBoardManager disableKeyboardManager];
#import "AppDelegate.h"
#import "IQKeyBoardManager.h"
#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [IQKeyBoardManager installKeyboardManager];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    

    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];

    //Case 1. UIViewController as rootViewController.
    if (false)
    {
        self.window.rootViewController = self.viewController;
    }
    //Case 2. UINavigationController as rootViewController.
    else
    {
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
        [navController.navigationBar setTintColor:[UIColor clearColor]];
        self.window.rootViewController = navController;
    }

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

@end
