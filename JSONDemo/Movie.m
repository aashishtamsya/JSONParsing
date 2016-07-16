//
//  Movie.m
//  JSONDemo
//
//  Created by Felix ITs 01 on 16/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import "Movie.h"

@implementation Movie 

@synthesize title;
@synthesize imageString;


+(Movie *)movieWithTitle:(NSString *)title imageString:(NSString *)imageString {
    
    Movie *movieModel = [[Movie alloc]init];
    movieModel.title = title;
    movieModel.imageString = imageString;
    
    return movieModel;
}
@end
