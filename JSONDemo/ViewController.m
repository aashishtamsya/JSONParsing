//
//  ViewController.m
//  JSONDemo
//
//  Created by Felix ITs 01 on 16/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initializeViewController];
    NSData *dataFromWeb = [self fetchDataFromURL:kRequestURL];
    [self parseJSONWithData:dataFromWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeViewController {
    
    listOfMovies = [[NSMutableArray alloc]init];
    
}
#pragma mark JSON Parsing Methods

-(NSData *)fetchDataFromURL:(NSString*) urlString {
    
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    NSData *data = nil;
    
    if (url != nil) {
        //get data
        NSLog(@"Data fetching...");

        data = [NSData dataWithContentsOfURL:url];
    }
    else {
        NSLog(@"URL is nil");
    }
    
    return data;
}

-(void)parseJSONWithData:(NSData *)data {
    
    if (data != nil) {
        NSLog(@"JSON Response fetching...");

        NSError *error;
        
        NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error != nil) {
            NSLog(@"ERROR : %@",error.localizedDescription);
        }
        else {
            //convert all data from web to custom object (model)
            NSLog(@"Converting to custom object...");

            for (NSDictionary *dictionary in jsonResponse) {
                
                NSString *title = [dictionary valueForKey:@"title"];
                NSString *imageString = [dictionary valueForKey:@"image"];
                
                Movie *movieModel = [Movie movieWithTitle:title imageString:imageString];
                
                [listOfMovies addObject:movieModel];
            }
            
            if (listOfMovies.count > 0) {
                NSLog(@"Reloading data...");

                [self.movieTableView reloadData];
            }
            else {
                NSLog(@"Zero Movies fetched.");

            }
         
        }
    }
    else {
        NSLog(@"DATA is nil");
    }
}

#pragma mark Image- Data Conversion Methods

-(UIImage *)imageFromString:(NSString *)imageString {
    
    NSData *imageData = [[NSData alloc]initWithBase64EncodedString:imageString options:NSDataBase64Encoding64CharacterLineLength];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}

#pragma mark UItableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return listOfMovies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    
    Movie *movieModel = [listOfMovies objectAtIndex:indexPath.row];
    
    cell.movieTitle.text = movieModel.title;
    
    cell.poster.image = [self imageFromString:movieModel.imageString];
    
    
    
    return cell;
    
}



@end
