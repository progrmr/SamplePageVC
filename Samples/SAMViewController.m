//
//  SAMViewController.m
//  Samples
//
//  Created by Gary Morris on 5/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SAMViewController.h"
#import "SAMPageVC.h"

@interface SAMViewController()  <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPageViewController*     pageVC;
@property (nonatomic, strong) NSMutableArray*           pages;        // array of SAMPageVC objects

@end


@implementation SAMViewController

- (void)loadView
{
    // create the view
    UIView* view = [[UIView alloc] init];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    view.backgroundColor  = [UIColor blueColor];
    self.view = view;
    
    // create the page view controller
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                options:nil];
    self.pageVC.dataSource = self;
    self.pageVC.delegate   = self;
    
    // create the pages
    self.pages = [NSMutableArray array];
    for (int i=1; i<=10; i++) {
        SAMPageVC* aPageVC = [[SAMPageVC alloc] init];
        [self.pages addObject:aPageVC];
    }
    
    // set the starting page
    SAMPageVC* currentPage = self.pages[0];
    [self.pageVC setViewControllers:@[currentPage] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // add the pageVC as a child VC
    [self addChildViewController:self.pageVC];
    [view addSubview:self.pageVC.view];
    self.pageVC.view.frame = self.view.bounds;
    [self.pageVC didMoveToParentViewController:self];
}

#pragma mark -
#pragma mark UIPageViewControllerDataSource methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger pageNumber = [self.pages indexOfObject:viewController] - 1;
    
    return (pageNumber >= 0) ? self.pages[pageNumber] : nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger pageNumber = [self.pages indexOfObject:viewController] + 1;

    return (pageNumber < self.pages.count) ? self.pages[pageNumber] : nil;
}

@end
