//
//  UILabel+Copyable.swift
//  UILabel+Copyable Demo
//
//  Created by Alexandre Oliveira Santos on 2/3/20.
//  Copyright © 2020 iAOS. All rights reserved.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public extension UILabel {
    // MARK: - Custom Flags

    private struct AssociatedKeys {
        static var isCopyingEnabled: UInt8 = 0
        static var shouldUseLongPressGestureRecognizer: UInt8 = 1
        static var longPressGestureRecognizer: UInt8 = 2
    }

    /// Set this property to `true` in order to enable the copy feature. Defaults to `false`.
    @objc
    @IBInspectable var isCopyingEnabled: Bool {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isCopyingEnabled, newValue, .OBJC_ASSOCIATION_ASSIGN)
            setupGestureRecognizers()
        }
        get {
            let value = objc_getAssociatedObject(self, &AssociatedKeys.isCopyingEnabled)
            return (value as? Bool) ?? false
        }
    }


    /// Used to enable/disable the internal long press gesture recognizer. Defaults to `true`.
    @IBInspectable var shouldUseLongPressGestureRecognizer: Bool {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldUseLongPressGestureRecognizer, newValue, .OBJC_ASSOCIATION_ASSIGN)
            setupGestureRecognizers()
        }
        get {
            return (objc_getAssociatedObject(self, &AssociatedKeys.shouldUseLongPressGestureRecognizer) as? Bool) ?? true
        }
    }

    @objc
    var longPressGestureRecognizer: UILongPressGestureRecognizer? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.longPressGestureRecognizer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.longPressGestureRecognizer) as? UILongPressGestureRecognizer
        }
    }
    
    // MARK: - UIResponder

    @objc
    override var canBecomeFirstResponder: Bool {
        return isCopyingEnabled
    }

    @objc
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        // Only return `true` when it's the copy: action AND the `copyingEnabled` property is `true`.
        return (action == #selector(self.copy(_:)) && isCopyingEnabled)
    }

    @objc
    override func copy(_ sender: Any?) {
        if isCopyingEnabled {
            // Copy the label text
            let pasteboard = UIPasteboard.general
            pasteboard.string = text
        }
    }

    // MARK: - UI Actions

    @objc internal func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer === longPressGestureRecognizer && gestureRecognizer.state == .began {
            becomeFirstResponder()

            let copyMenu = UIMenuController.shared
            copyMenu.arrowDirection = .default
            if #available(iOS 13.0, *) {
                copyMenu.showMenu(from: self, rect: bounds)
            } else {
                // Fallback on earlier versions
                copyMenu.setTargetRect(bounds, in: self)
                copyMenu.setMenuVisible(true, animated: true)
            }
        }
    }

    // MARK: - Private Helpers

    fileprivate func setupGestureRecognizers() {
        // Remove gesture recognizer
        if let longPressGR = longPressGestureRecognizer {
            removeGestureRecognizer(longPressGR)
            longPressGestureRecognizer = nil
        }

        if shouldUseLongPressGestureRecognizer && isCopyingEnabled {
            isUserInteractionEnabled = true
            // Enable gesture recognizer
            let longPressGR = UILongPressGestureRecognizer(target: self,
                                                           action: #selector(longPressGestureRecognized(gestureRecognizer:)))
            longPressGestureRecognizer = longPressGR
            addGestureRecognizer(longPressGR)
        }
    }
}
