//
//  NetworkManager.h
//  MusicSearch
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+ (instancetype)sharedInstance;

- (void)getSearchResultsForSearchText:(NSString *)searchText
                         successBlock:(void (^)(NSArray *))successBlock
                         failureBlock:(void (^)(NSError *))failureBlock;

- (void)getLyricsForSong:(NSString *)trackName
              artistName:(NSString *)artistName
            successBlock:(void (^)(NSDictionary *))successBlock
            failureBlock:(void (^)(NSError *))failureBlock;

@end
