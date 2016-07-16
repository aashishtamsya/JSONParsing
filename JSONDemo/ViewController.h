//
//  ViewController.h
//  JSONDemo
//
//  Created by Felix ITs 01 on 16/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//
#define kRequestURL @"https://json-test-sample-project.firebaseio.com/api.json"

#define kCellIdentifier @"movie"


#import <UIKit/UIKit.h>
#import "Movie.h"
#import "TableViewCell.h"




@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *listOfMovies;
}
@property (weak, nonatomic) IBOutlet UITableView *movieTableView;

@end

