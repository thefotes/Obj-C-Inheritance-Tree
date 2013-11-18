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
@property (strong, nonatomic) NSString *classNameToSearch;
@property (strong, nonatomic) ITCrawler *crawler;
@end

@implementation ITViewController

#pragma mark Properties

- (ITCrawler *)crawler
{
    return _crawler = _crawler ?: [[ITCrawler alloc] init];
}

#pragma mark Table View DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([self.crawler.classNamesArray objectAtIndex:indexPath.row]) {
        cell.textLabel.text = [self.crawler.classNamesArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.crawler.classNamesArray) {
         return self.crawler.classNamesArray.count;
    } else {
        return 0;
    }
}

#pragma mark Textfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.classNameToSearch = textField.text;
    [self.crawler.classNamesArray removeAllObjects];
    [self.crawler getSuperClassForClassFromString:self.classNameToSearch];
    [self.tableView reloadData];
    return YES;
}

@end
