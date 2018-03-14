//
//  FixEvernoteSnippetsView.m
//  FixEvernoteSnippetsView
//
//  Created by Yoshimasa Niwa on 3/14/18.
//  Copyright © 2018 Yoshimasa Niwa. All rights reserved.
//

#import "FixEvernoteSnippetsView.h"

@import AppKit;
@import ObjectiveC.runtime;
@import os.log;

@interface NSViewController (FixEvernoteSnippetsView)

- (void)_fixEvernoteSnippetsView_viewDidLoad;

@end

@implementation NSViewController (FixEvernoteSnippetsView)

- (void)_fixEvernoteSnippetsView_viewDidLoad
{
    [self _fixEvernoteSnippetsView_viewDidLoad];

    NSScrollView * const scrollView = (NSScrollView *)self.view.subviews.firstObject;
    scrollView.drawsBackground = NO;
}

@end

@implementation FixEvernoteSnippetsView

+ (void)load
{
    Class const klass = NSClassFromString(@"EN4SnippetsViewController");

    Method const method1 = class_getInstanceMethod(klass, @selector(viewDidLoad));
    Method const method2 = class_getInstanceMethod(klass, @selector(_fixEvernoteSnippetsView_viewDidLoad));
    method_exchangeImplementations(method1, method2);

    os_log_info(OS_LOG_DEFAULT, "Fix for Evernote snippets view loaded.");
}

@end
