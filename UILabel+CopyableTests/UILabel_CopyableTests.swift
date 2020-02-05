//
//  UILabel_CopyableTests.swift
//  UILabel+CopyableTests
//
//  Created by Alexandre Oliveira Santos on 2/3/20.
//  Copyright © 2020 Alexandre Santos. All rights reserved.
//

import XCTest
@testable import UILabel_Copyable

class UILabel_CopyableTests: XCTestCase {

    func testCanBecomeFirstResponderShouldBeFalseByDefault() {
        // Given
        let label = newLabel()

        // When
        let canBecomeFirstResponder = label.canBecomeFirstResponder

        // Then
        XCTAssertFalse(canBecomeFirstResponder)
    }

    func testCanBecomeFirstResponderShouldBeTrueWhenIsCopyingEnabledIsTrue() {
        // Given
        let label = newLabel()
        label.isCopyingEnabled = true

        // When
        let canBecomeFirstResponder = label.canBecomeFirstResponder

        // Then
        XCTAssertTrue(canBecomeFirstResponder)
    }

    func testCanPerformActionShouldBeFalseByDefault() {
        // Given
        let label = newLabel()

        // When
        let canPerformAction = label.canPerformAction(#selector(label.copy(_:)), withSender: nil)

        // Then
        XCTAssertFalse(canPerformAction)
    }

    func testCanPerformActionShouldBeTrueWhenIsCopyingEnabledIsTrue() {
        // Given
        let label = newLabel()
        label.isCopyingEnabled = true

        // When
        let canPerformAction = label.canPerformAction(#selector(label.copy(_:)), withSender: nil)

        // Then
        XCTAssertTrue(canPerformAction)
    }

    func testCopyActionShouldSetTextToPasteboard() {
        // Given
        let pasteboard = UIPasteboard.general
        pasteboard.string = ""
        let label = newLabel()
        label.text = "Some test text"
        label.isCopyingEnabled = true

        // When
        label.copy(nil)

        // Then
        XCTAssertEqual(pasteboard.string, label.text)
    }

    func testLongPressGestureRecognizerShouldPresentMenu() {
        // Given
        let label = newLabel()
        label.isCopyingEnabled = true
        label.shouldUseLongPressGestureRecognizer = true
        UIMenuController.shared.arrowDirection = .up

        // When
        label.longPressGestureRecognizer?.state = .began
        label.longPressGestureRecognized(gestureRecognizer: label.longPressGestureRecognizer!)

        // Then
        XCTAssertEqual(UIMenuController.shared.arrowDirection, .default)
    }

    func testLongPressGestureRecognizerShouldBeNilWhenSetToFalse() {
        // Given
        let label = newLabel()
        label.isCopyingEnabled = true

        // When
        label.shouldUseLongPressGestureRecognizer = false

        // Then
        XCTAssertNil(label.longPressGestureRecognizer)
    }

}

extension UILabel_CopyableTests {
    fileprivate func newLabel() -> UILabel {
        UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    }
}
