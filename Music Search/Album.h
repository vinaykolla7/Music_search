//
//  Album.h
//  MusicSearch
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Album : NSObject

@property (strong, nonatomic) NSString *trackName;
@property (strong, nonatomic) NSString *artistName;
@property (strong, nonatomic) NSString *albumName;
@property (strong, nonatomic) UIImage *albumImage;
@property (strong, nonatomic) NSString *albumImageURL;


- (instancetype)initWithAlbumName:(NSString *)albumName
                       albumImageURL:(NSString *)albumImageURL
                       artistName:(NSString *)artistName
                        trackName:(NSString *)trackName;
@end
