//
//  Movie.h
//  JSONDemo
//
//  Created by Felix ITs 01 on 16/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
{
    NSString *imageString;  //instance variable
    NSString *title;
}

@property (nonatomic,copy) NSString *imageString;
@property (nonatomic,copy) NSString *title;

+(Movie *)movieWithTitle:(NSString *)title imageString:(NSString *)imageString;

@end
