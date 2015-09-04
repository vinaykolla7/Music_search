//
//  AlbumFactory.h
//  MusicSearch
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumFactory : NSObject

+ (void)albumsFromRawAlbums:(NSArray *)rawAlbums
                   successBlock:(void (^)(NSArray *albums))successBlock;

@end
