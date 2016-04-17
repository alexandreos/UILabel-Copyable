//
//  UILabel_Copyable_Tests.m
//  UILabel+Copyable Tests
//
//  Created by Alexandre Santos on 10/04/15.
//  Copyright (c) 2015 iAOS Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UILabel+Copyable.h"

#pragma mark - Private Properties

@interface UILabel ()

@property (nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

#pragma mark - Unit Test

@interface UILabel_Copyable_Tests : XCTestCase

@property (nonatomic) UILabel *label;

@end

@implementation UILabel_Copyable_Tests

#pragma mark - Test Life Cycle

- (void)setUp {
    [super setUp];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Tests

- (void)testProperties
{
    XCTAssertFalse([self.label canPerformAction:@selector(copy:) withSender:nil], @"'-canPerformAction:withSender:' should return YES for the copy: selector");
    SEL selector = nil;
    XCTAssertNoThrow([self.label canPerformAction:selector withSender:nil]);
    
    // Validate defaults
    XCTAssertFalse(self.label.copyingEnabled, @"Default 'copyingEnabled' should be NO");
    XCTAssertTrue(self.label.shouldUseLongPressGestureRecognizer, @"Default 'shouldUseLongPressGestureRecognizer' should be YES");
    XCTAssertFalse([self.label canBecomeFirstResponder], @"'-canBecomeFirstResponder' should return NO when 'copyingEnabled' is NO");
    XCTAssertNil(self.label.longPressGestureRecognizer);
    
    // Enable copying
    self.label.copyingEnabled = YES;
    XCTAssertTrue(self.label.copyingEnabled);
    XCTAssertTrue(self.label.shouldUseLongPressGestureRecognizer);
    XCTAssertTrue([self.label canBecomeFirstResponder], @"'-canBecomeFirstResponder' should return YES when 'copyingEnabled' is YES");
    XCTAssertNotNil(self.label.longPressGestureRecognizer);
}

- (void)testCopy
{
    // Clear the pasteboard
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = @"";
    
    self.label.text = @"Testing";
    
    // Simulate the copy: selection when copyingEnabled is NO
    self.label.copyingEnabled = NO;
    XCTAssertNoThrow([self.label copy:nil]);
    XCTAssertFalse([pasteboard.string isEqualToString:self.label.text]);
    
    // Simulate the copy: selection when copyingEnabled is YES
    self.label.copyingEnabled = YES;
    XCTAssertNoThrow([self.label copy:nil]);
    XCTAssertTrue([pasteboard.string isEqualToString:self.label.text]);
}

@end
