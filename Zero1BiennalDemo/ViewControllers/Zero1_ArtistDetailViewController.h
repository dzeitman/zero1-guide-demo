//
//  Zero1_ArtistDetailViewController.h
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/5/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Zero1_ArtistDetailViewController : UITableViewController
@property (nonatomic,strong) NSMutableDictionary  *data; 
 /*
artistid = 40;
bio = "<null>";
firstname = Ranu;
lastname = Mukherjee;
photo = "<null>";
website = "freynorris.com";
*/
 
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UILabel *fullnameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;
@property (strong, nonatomic) IBOutlet UILabel *websiteLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagsLabel;

@end
