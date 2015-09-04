//
//  NetworkManager.m
//  MusicSearch
//
//  Created by Vinay Kolla on 9/1/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "NetworkManager.h"
#import "AlbumFactory.h"

NSString *const baseURL = @"https://itunes.apple.com/search?term=";

@implementation NetworkManager

+ (instancetype)sharedInstance {
    
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[NetworkManager alloc] init];
    });
    
    return sharedInstance;
}

- (void)getSearchResultsForSearchText:(NSString *)searchText
                         successBlock:(void (^)(NSArray *))successBlock
                         failureBlock:(void (^)(NSError *))failureBlock {

    
    
    NSString *formattedString = [NSString stringWithFormat:@"%@%@", baseURL, [self searchTextForQuering:searchText]];
    
    NSURL *url = [NSURL URLWithString:formattedString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      NSError *serializationError = nil;
                                      NSDictionary *rawResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                                 options:NSJSONReadingAllowFragments
                                                                                                   error:&serializationError];
                                      
                                      if (error || serializationError) {
                                          failureBlock(error);
                                      }
                                      else {
                                          [AlbumFactory albumsFromRawAlbums:rawResponse[@"results"] successBlock:^(NSArray *albums){
                                              successBlock(albums);
                                          }];
                                      }
    }];
    
    [task resume];
}


- (NSString *)searchTextForQuering:(NSString *)searchText {
    
    return [searchText stringByReplacingOccurrencesOfString:@" " withString:@"+"];
}

- (void)getLyricsForSong:(NSString *)trackName
              artistName:(NSString *)artistName
            successBlock:(void (^)(NSDictionary *))successBlock
            failureBlock:(void (^)(NSError *))failureBlock {
  
  NSString *formattedArtistName = [self searchTextForQuering:artistName];
  NSString *formattedSongName = [self searchTextForQuering:trackName];
  NSString *formattedString = [NSString stringWithFormat:@"http://lyrics.wikia.com/api.php?func=getSong&artist=%@&song=%@&fmt=json", formattedArtistName, formattedSongName];
  
  NSString *encodedSearchString = [formattedString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
  NSURL *url = [NSURL URLWithString:encodedSearchString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
  
  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                ^(NSData *data, NSURLResponse *response, NSError *error) {
                                  
                                  NSError *serializationError = nil;
                                  NSDictionary *rawResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                              options:NSJSONReadingMutableContainers
                                                                                                error:&serializationError];
                                  
                                  if (serializationError) {
                                    failureBlock(serializationError);
                                  }
                                  else {
                                      successBlock(rawResponse);
                                  }
                                }];
  
  [task resume];
}

@end
