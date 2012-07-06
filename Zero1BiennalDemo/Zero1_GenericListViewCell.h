//
//  Zero1_GenericListViewCell.h
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/5/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Zero1_GenericListViewCell : UITableViewCell <UIAppearance>

@property (nonatomic, weak) UIColor *backgroundCellColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, weak) UIColor *labelTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, weak) UIColor *detailTextColor UI_APPEARANCE_SELECTOR;

 
@end
