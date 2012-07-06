//
//  Zero1_ArtistDetailViewController.m
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/5/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "Zero1_ArtistDetailViewController.h"

@interface Zero1_ArtistDetailViewController ()

@end

@implementation Zero1_ArtistDetailViewController

@synthesize idLabel;
@synthesize fullnameLabel;
@synthesize photoImageView;
@synthesize bioTextView;
@synthesize websiteLabel;
@synthesize tagsLabel;
@synthesize data;
 



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
     if ([segue.identifier isEqualToString:@"push2Map"])
	{
        
		UIViewController *controller = 
        segue.destinationViewController;
       // controller.data = data;  //sr.page;
        
        NSLog(@"%@", [data description]);
    }
    
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /*
        artistid = 40;
        bio = "<null>";
        firstname = Ranu;
        lastname = Mukherjee;
        photo = "<null>";
        website = "freynorris.com";
   */     
 
    self.idLabel.text =[@"" stringByAppendingFormat:@"%@",[data objectForKey:@"artistid"]];
    
    NSString *fn = ([data objectForKey:@"firstname"])?[data objectForKey:@"firstname"]: @"";
    NSString *ln = ([data objectForKey:@"lastname"])?[data objectForKey:@"lastname"]: @"";
    NSString *sep = ([[data objectForKey:@"lastname"] length]>0 && [[data objectForKey:@"firstname"] length]>0 )?@" ":@"";
    NSString *fullname = [[@"" stringByAppendingFormat:@"%@%@%@",fn,sep,ln] capitalizedString];
    
    self.fullnameLabel.text = fullname;
    self.navigationItem.title = fullname;
      self.bioTextView.text =   [self checkForNil:[data objectForKey:@"bio"]];
    self.websiteLabel.text = ([data objectForKey:@"website"])? [data objectForKey:@"website"]:@"";
     
    
    self.tagsLabel.text = [self buildTags: fullname];
    // photo
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    
    dispatch_async(queue, ^{
        NSString *photoURL =  [self checkForNilPhoto:[self.data objectForKey:@"photo"]];
        NSURL *url = [NSURL URLWithString:photoURL];
        NSData *photoData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:photoData]  ;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
             self.photoImageView.image  = image;  
        });
    });

    
}


-(NSString *)buildTags:(id)value{
  value = [value stringByReplacingOccurrencesOfString:@"," withString:@" "];
    
    
    NSArray *tags = [value componentsSeparatedByString:@" "];
    
   
    NSString *v = @"";
    
    if (value == [NSNull null]) {
        v = @"";     
    }else {
        v = [tags componentsJoinedByString:@", "];
    }
    return v;
    
}

-(NSString *)checkForNilPhoto:(id)value{
    
    NSString *photoURL = @"http://farm9.staticflickr.com/8429/7501586546_c91891b0f1_n.jpg";//
     
    NSString *v = @"";
    
    if (value == [NSNull null]) {
        v = photoURL;     
    }else {
        v = value;
    }
    return v;
    
}

-(NSString *)checkForNil:(id)value{
     NSString *placeholderText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n \n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    NSString *v = @"";
    
    if (value == [NSNull null]) {
       v = placeholderText;     
    }else {
        v = value;
    }
return v;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 7;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *listItem = [self.data objectAtIndex:indexPath.row];
    
    
    static NSString *CellIdentifier = @"GenericListViewCell";
    Zero1_GenericListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    // Configure the cell...
 
    // artistid = 40;
  ////   bio = "<null>";
 //    firstname = Ranu;
  //   lastname = Mukherjee;
  //   photo = "<null>";
  //   website = "freynorris.com";
   
    
    cell.textLabel.text = [[@"" stringByAppendingFormat:@"%@, %@",[listItem objectForKey:@"lastname"],  [listItem objectForKey:@"firstname"]] capitalizedString];
    //  cell.detailTextLabel.text = [@"" stringByAppendingFormat:@"View the %@ section",[self.data objectAtIndex:indexPath.row]] ;
    
    return cell;
    
}
*/
- (void)viewDidUnload
{
    [self setIdLabel:nil];
    [self setFullnameLabel:nil];
    [self setPhotoImageView:nil];
    [self setBioTextView:nil];
    [self setWebsiteLabel:nil];
    [self setTagsLabel:nil];
      [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
