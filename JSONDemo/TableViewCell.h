//
//  TableViewCell.h
//  JSONDemo
//
//  Created by Felix ITs 01 on 16/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *poster;

@property (weak, nonatomic) IBOutlet UILabel *movieTitle;


@end
