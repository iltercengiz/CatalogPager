//
//  CatalogViewController.m
//  CatalogPager
//
//  Created by Ilter Cengiz on 25/08/14.
//  Copyright (c) 2014 Ilter Cengiz. All rights reserved.
//

#import "CatalogViewController.h"
#import "CatalogPageViewController.h"

@interface CatalogViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property NSDictionary *catalog;

@end

@implementation CatalogViewController

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        _catalog = @{
                     @1: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4"],
                     @2: @[@"Item 1", @"Item 2", @"Item 3"],
                     @3: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"],
                     @4: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6", @"Item 7", @"Item 8", @"Item 9"],
                     @5: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"],
                     @6: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6", @"Item 7"],
                     @7: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4"],
                     @8: @[@"Item 1", @"Item 2"],
                     @9: @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6", @"Item 7", @"Item 8"]
                     };
        
    }
    
    return self;
    
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    
    self.title = @"Catalog";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - View Pager data source

- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return self.catalog.count;
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *tabView = [UILabel new];
    
    tabView.backgroundColor = [UIColor clearColor];
    tabView.textAlignment = NSTextAlignmentCenter;
    tabView.textColor = [UIColor blackColor];
    tabView.text = [NSString stringWithFormat:@"Page %lu", index + 1];
    
    [tabView sizeToFit];
    
    return tabView;
    
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    CatalogPageViewController *cpvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CatalogPageViewController"];
    cpvc.catalogItems = self.catalog[@(index + 1)];
    return cpvc;
    
}

#pragma mark - View Pager delegate

- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
        case ViewPagerOptionCenterCurrentTab:
            return 1.0;
        case ViewPagerOptionTabLocation:
            return 0.0;
        case ViewPagerOptionTabHeight:
            return 49.0;
        case ViewPagerOptionTabOffset:
            return 36.0;
        case ViewPagerOptionTabWidth:
            return UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? 128.0 : 96.0;
        case ViewPagerOptionFixFormerTabsPositions:
            return 1.0;
        case ViewPagerOptionFixLatterTabsPositions:
            return 1.0;
        default:
            return value;
    }
}

@end
