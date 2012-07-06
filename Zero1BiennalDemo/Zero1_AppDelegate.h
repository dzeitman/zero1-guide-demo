//
//  Zero1_AppDelegate.h
//  Zero1BiennalDemo
//
//  Created by DAN Zeitman on 7/3/12.
//  Copyright (c) 2012 DVPweb.com - DBA: Dan Zeitman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Zero1_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//static data
@property (strong, nonatomic) NSMutableArray *mainMenuData;
@property (strong, nonatomic) NSMutableArray *tabbarMenuData;

//dynamic data
@property (strong,nonatomic) NSMutableArray *artists;
@property (strong,nonatomic) NSMutableArray *projects;
@property (strong,nonatomic) NSMutableArray *programs;
@property (strong,nonatomic) NSMutableArray *venues;

@property (strong,nonatomic) NSMutableDictionary *selectedArtist;
@property (strong,nonatomic) NSMutableDictionary *selectedProject;
@property (strong,nonatomic) NSMutableDictionary *selectedProgram;
@property (strong,nonatomic) NSMutableDictionary *selectedVenue;

@end
