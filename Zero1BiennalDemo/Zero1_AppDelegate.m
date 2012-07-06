//
//  Zero1_AppDelegate.m
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/3/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "AppConstants.h"
#import "Zero1_AppDelegate.h"
#import "Zero1_GenericListViewCell.h"

@implementation Zero1_AppDelegate

@synthesize window = _window;

// static
@synthesize mainMenuData;
@synthesize tabbarMenuData;

// dynamic 
@synthesize artists;
@synthesize projects;
@synthesize programs;
@synthesize venues;
@synthesize selectedArtist;
@synthesize selectedProject;
@synthesize selectedProgram;
@synthesize selectedVenue;



-(void)loadData{
    
//  setup static menu data;
    self.mainMenuData =  [[NSMutableArray alloc] initWithObjects:@"Programs",@"Schedule",@"Locations & Maps",@"Sign Up for eNews",@"About", nil];
    
    self.tabbarMenuData =  [[NSMutableArray alloc] initWithObjects:@"Home",@"Nearby",@"Planner",@"React",@"Search", nil];

    [self getData];
}


-(id)parseResponseData:(NSData*)theData{
     return  [[NSJSONSerialization JSONObjectWithData:theData options:NSJSONReadingAllowFragments error:nil] mutableCopy];
}



-(NSMutableArray *)sortArtistsByLastNameFirstName:(NSMutableArray *)artistArray{
 	//NSSortDescriptor *nameDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"programInfoString" ascending:YES] autorelease];	
    NSSortDescriptor *fnDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstname" ascending:YES] ;
    NSSortDescriptor *lnDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastname" ascending:YES];
    
	NSArray	*sortDescriptors =  [NSArray arrayWithObjects:lnDescriptor,fnDescriptor,nil];
	
	NSMutableArray *sortedList = [[artistArray sortedArrayUsingDescriptors:sortDescriptors]mutableCopy];
	return  sortedList; 
	
}


-(void)getArtists{
    
    NSString *methodEndpointURL = [api_base_url stringByAppendingString:@"artists"];
    NSURL *url = [NSURL URLWithString:methodEndpointURL];
    
    NSData *resultsData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *responseData = (NSMutableDictionary *) [self parseResponseData:resultsData];
    
    self.artists =  [self sortArtistsByLastNameFirstName:[(NSMutableArray *)[responseData objectForKey:@"artists"] mutableCopy] ];
    
    
    /*
     
     {
     artistid = 40;
     bio = "<null>";
     firstname = Ranu;
     lastname = Mukherjee;
     photo = "<null>";
     website = "freynorris.com";
     }     
     */
}


-(void)getPrograms{
    
    NSString *methodEndpointURL = [api_base_url stringByAppendingString:@"programs"];
    NSURL *url = [NSURL URLWithString:methodEndpointURL];
    
    NSData *resultsData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *responseData = (NSMutableDictionary *) [self parseResponseData:resultsData];
    
    self.programs =  [(NSMutableArray *)[responseData objectForKey:@"programs"] mutableCopy];
    /*
     {
     description = "<null>";
     enddate = "2012-09-22";
     hours = "<null>";
     photo = "<null>";
     programid = 24;
     programname = "ZERO1: BIENNIAL Festival";
     startdate = "2012-09-21";
     type = Performance;
     website = "taiko.org";
     }
     
     */
}


-(void)getProjects{
    
    NSString *methodEndpointURL = [api_base_url stringByAppendingString:@"projects"];
    NSURL *url = [NSURL URLWithString:methodEndpointURL];
    
    NSData *resultsData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *responseData =  (NSMutableDictionary *)[self parseResponseData:resultsData];
    
    self.projects =  [(NSMutableArray *)[responseData objectForKey:@"projects"] mutableCopy];
    
    /*
     
     {
     description = "<null>";
     photo = "<null>";
     projectid = 38;
     projectname = "Performance and Talk";
     website = "swissnexsanfrancisco.org";
     year = 2012;
     }     */
    
}

-(void)getVenues{
    
    NSString *methodEndpointURL = [api_base_url stringByAppendingString:@"venues"];
    NSURL *url = [NSURL URLWithString:methodEndpointURL];
    
    NSData *resultsData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *responseData =  (NSMutableDictionary *)[self parseResponseData:resultsData];
    
    self.venues =  [(NSMutableArray *)[responseData objectForKey:@"venues"] mutableCopy];
    /*
     
     {
     address = "S. 1st Street,";
     description = "<null>";
     lat = "<null>";
     long = "<null>";
     photo = "<null>";
     venueid = 1;
     venuename = "Parqe De Los Pablodores (Gore Park)";
     website = "future-cities-lab.net";
     zip = 95113;
     }     */
}

-(void)getData{
    
    [self getArtists];
    [self getPrograms];
    [self getProjects];
    [self getVenues];
    
}

 
 
 -(void)setApplicationAppearance{
     // Override point for customization after application launch.
     //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"alfred_logo.png"] forBarMetrics:UIBarMetricsDefault];
     
     
     
 //    UIImage *NavigationPortraitBackground = [[UIImage imageNamed:@"slate.jpg"]   resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     
     
  //   UIImage *NavigationLandscapeBackground = [[UIImage imageNamed:@"slate.jpg"]    resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     
     
     UIImage *tabbarBackground = [[UIImage imageNamed:@"red_wood_tabbar.jpg"] 
                                  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     
  //   UIImage *tabbarSelectedBackground = [[UIImage imageNamed:@"red_wood_tabbar_selected.jpg"]     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     // top, left, bottom, right

     UIImage *textBackground = [[UIImage imageNamed:@"copper-metal-bright.jpg"] 
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0,0)];
     
     
     UIImage *TableViewBackground = [[UIImage imageNamed:@"small_leather.jpg"] 
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

     
     // Create image for navigation background - portrait
     UIImage *textOutlineBackground = [[UIImage imageNamed:@"Chrome-metal-texture-bright.jpg"] 
                                       resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     
     
     
     
       
    [[UITableView appearance] setBackgroundColor:[UIColor colorWithPatternImage:TableViewBackground]];
     //[[UITableView appearance] setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
      // color the line seperator 
     [[UITableView appearance] setSeparatorColor:[UIColor colorWithPatternImage:textBackground]];
     
 
     
   
    // using our subclassed tableview cell - since appearance is not possible without subclassing 
     
     // add baby blue tint to textured background
    [[Zero1_GenericListViewCell appearance] setBackgroundCellColor:[UIColor colorWithRed:0.000 green:0.418 blue:1.000 alpha:0.150]];
     // chrome text
    [[Zero1_GenericListViewCell appearance] setLabelTextColor:[UIColor colorWithPatternImage:textOutlineBackground]];
    [[Zero1_GenericListViewCell appearance] setDetailTextColor:[UIColor colorWithPatternImage:textBackground]];
    /* 
     [[UITableViewCell appearance]  setTitleTextAttributes:
      [NSDictionary dictionaryWithObjectsAndKeys:
       [UIColor colorWithPatternImage:textOutlineBackground], UITextAttributeTextColor, 
       [UIColor blackColor] , UITextAttributeTextShadowColor, 
       [NSValue valueWithUIOffset:UIOffsetMake(1.2, 1.2)], UITextAttributeTextShadowOffset, 
       [UIFont fontWithName:@"Airstream NF" size:24], UITextAttributeFont, 
       nil]];
     
*/
     
     
        ///cell.textLabel.textColor
     // Set the background image all UINavigationBars
     [[UINavigationBar appearance] setBackgroundImage:tabbarBackground 
                                        forBarMetrics:UIBarMetricsDefault];
     [[UINavigationBar appearance] setBackgroundImage:tabbarBackground 
                                        forBarMetrics:UIBarMetricsLandscapePhone];
     
     // Set the background image all UINavigationBars
     [[UITabBar appearance] setBackgroundImage:tabbarBackground];
     
     
     
     //    [[UITabBar appearance] setSelectionIndicatorImage:tabbarSelectedBackground]; 
     
     
     
     
     //191, 151, 27  166, 131, 23
     // Set the text appearance for navbar
     [[UINavigationBar appearance] setTitleTextAttributes:
      [NSDictionary dictionaryWithObjectsAndKeys:
       [UIColor colorWithPatternImage:textOutlineBackground], UITextAttributeTextColor, 
       [UIColor blackColor] , UITextAttributeTextShadowColor, 
       [NSValue valueWithUIOffset:UIOffsetMake(1.2, 1.2)], UITextAttributeTextShadowOffset, 
       [UIFont fontWithName:@"Airstream NF" size:24], UITextAttributeFont, 
       nil]];
     
     //[UIColor colorWithPatternImage:textOutlineBackground]
     
     //[UIFont fontWithName:@"Airstream NF" size:24], UITextAttributeFont, 
     /*  
      self.layer.shadowColor = [[UIColor blackColor] CGColor];
      self.layer.shadowOffset = CGSizeMake(0.0, 3.0);
      self.layer.shadowOpacity = 0.25;
      
      */
     
 }
 


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
 //   [self setApplicationAppearance];
    [self loadData];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
