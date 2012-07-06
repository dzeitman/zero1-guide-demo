//
//  Zero1_ArtistListViewController.m
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/5/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "Zero1_AppDelegate.h"
#import "Zero1_GenericListViewCell.h"
#import "Zero1_ArtistListViewController.h"
#import "Zero1_ArtistDetailViewController.h"

@interface Zero1_ArtistListViewController ()

@end

@implementation Zero1_ArtistListViewController

@synthesize data;

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

    Zero1_AppDelegate *AppDelegate =  [[UIApplication sharedApplication] delegate];	
    self.data = AppDelegate.artists;
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


//push2ArtistDetail

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSMutableDictionary *selectedItem = [[self.data objectAtIndex:indexPath.row] mutableCopy];
    
    // push2ArtistDetail
    //
    if ([segue.identifier isEqualToString:@"push2ArtistDetail"])
	{
          
		Zero1_ArtistDetailViewController *controller = 
        segue.destinationViewController;
       controller.data = selectedItem;  //sr.page;
          
          NSLog(@"%@", [selectedItem description]);
    }
    
        
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *listItem = [self.data objectAtIndex:indexPath.row];
    
    
    static NSString *CellIdentifier = @"GenericListViewCell";
    Zero1_GenericListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    // Configure the cell...
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
    //  (cond)? true:false;
    
    NSString *fn = ([listItem objectForKey:@"firstname"])?[listItem objectForKey:@"firstname"]: @"";
    NSString *ln = ([listItem objectForKey:@"lastname"])?[listItem objectForKey:@"lastname"]: @"";
    NSString *sep = ([[listItem objectForKey:@"lastname"] length]>0 && [[listItem objectForKey:@"firstname"] length]>0 )?@" ":@"";
      NSString *fullname = [[@"" stringByAppendingFormat:@"%@%@%@",fn, sep,ln] capitalizedString];

    cell.textLabel.text = fullname;
      cell.detailTextLabel.text = [@"" stringByAppendingFormat:@"View the %@ ",[[self.data objectAtIndex:indexPath.row] objectForKey:@"website"]] ;
    cell.imageView.image = [UIImage imageNamed:@"first@2x.png"];
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
