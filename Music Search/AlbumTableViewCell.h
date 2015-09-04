//
//  AlbumTableViewCell.h
//  Music Search
//
//  Created by Vinay Kolla on 9/2/15.
//  Copyright (c) 2015 Vinay Kolla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;

@interface AlbumTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImage *image;
- (void)configureCellWithAlbum:(Album *)album;

@end
