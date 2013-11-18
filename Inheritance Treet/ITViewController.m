//
//  ITViewController.m
//  Inheritance Treet
//
//  Created by Peter Foti on 11/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "ITViewController.h"
#import "ITCrawler.h"


@interface ITViewController ()

@property (weak, nonatomic) NSMutableArray *classNames;
@property (strong, nonatomic) NSString *classNameToSearch;
@property (strong, nonatomic) ITCrawler *crawler;
@end

@implementation ITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma Properties

- (ITCrawler *)crawler
{
    return _crawler = _crawler ?: [[ITCrawler alloc] init];
}

#pragma Table View DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[self.crawler getSuperClassForClassFromString:self.classNameToSearch] objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.crawler getSuperClassForClassFromString:self.classNameToSearch].count;
}

#pragma Textfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.classNameToSearch = textField.text;
    [self.tableView reloadData];
    return YES;
}

@end
