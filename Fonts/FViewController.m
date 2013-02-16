//
//  FViewController.m
//  Fonts
//
//  Created by stcui on 11-12-22.
//  Copyright (c) 2011年 stcui. All rights reserved.
//

#import "FViewController.h"

@implementation FViewController
{
    NSArray *_families;
    NSArray *_fonts;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _families = [[[UIFont familyNames] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] retain];
    
    NSMutableArray *fontNames = [[NSMutableArray alloc] initWithCapacity:_families.count];
    
    for (NSString *familyName in _families)
        [fontNames addObjectsFromArray:[UIFont fontNamesForFamilyName:familyName]];
    
    _fonts = fontNames;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_fonts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * const identifier = @"a";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier]
                autorelease];
        cell.textLabel.text = @"!#@$% 012345 abcdef ABCDEF";
    }
    UIFont *font = [UIFont fontWithName:[_fonts objectAtIndex:indexPath.row] size:17];

    cell.textLabel.font = font;
    cell.detailTextLabel.font = font;
    cell.detailTextLabel.text = [_fonts objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont *font = [UIFont fontWithName:[_fonts objectAtIndex:indexPath.row] size:17];
    return font.lineHeight * 3;
}

@end
