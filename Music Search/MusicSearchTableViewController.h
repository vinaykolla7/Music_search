//
//  TableViewController.h
//  Music Search
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay Kolla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicSearchTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
