//
//  Album.m
//  MusicSearch
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "Album.h"

@implementation Album

- (instancetype)initWithAlbumName:(NSString *)albumName
                       albumImageURL:(NSString *)albumImageURL
                       artistName:(NSString *)artistName
                        trackName:(NSString *)trackName {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _albumName = albumName;
    _artistName = artistName;
    _trackName = trackName;
    _albumImageURL = albumImageURL;
    
    return self;
}

@end
