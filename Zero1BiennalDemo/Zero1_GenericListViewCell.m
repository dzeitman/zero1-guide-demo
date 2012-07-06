//
//  Zero1_GenericListViewCell.m
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/5/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import "Zero1_GenericListViewCell.h"

@implementation Zero1_GenericListViewCell

@synthesize labelTextColor;
@synthesize detailTextColor;
@synthesize backgroundCellColor;

// custom setters

-(void)setLabelTextColor:(UIColor *)_labelTextColor{
      [self.textLabel setTextColor:_labelTextColor];
 }
 
-(void)setDetailTextColor:(UIColor *)_detailTextColor{
 [self.detailTextLabel setTextColor:_detailTextColor];
}

-(void)setBackgroundCellColor:(UIColor *)backgroundColor
{
     [super setBackgroundColor:backgroundColor];
    //fixes label background from applying colors
    [self.textLabel setBackgroundColor:[UIColor clearColor]]; 
    [self.detailTextLabel setBackgroundColor:[UIColor clearColor]];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
