UILabel+Copyable ![Supported Platforms](https://img.shields.io/cocoapods/p/UILabel+Copyable.svg) [![Latest pod release](https://img.shields.io/cocoapods/v/UILabel+Copyable.svg)](https://cocoapods.org/pods/UILabel+Copyable) [![Build Status](https://travis-ci.org/alexandreos/UILabel-Copyable.svg?branch=master)](https://travis-ci.org/alexandreos/UILabel-Copyable) [![codecov.io](https://codecov.io/github/alexandreos/UILabel-Copyable/coverage.svg?branch=master)](https://codecov.io/github/alexandreos/UILabel-Copyable?branch=master)
===
A simple UILabel category meant to add copy functionality to it.

# Features
- Supports Interface Builder
- Supports long press gesture
- Allows enable/disable the copy feature
- Works with all UILabel objects already in your project

# Installation

### CocoaPods
UILabel+Copyable is available via [CocoaPods](http://cocoapods.org/). 

```ruby
pod 'UILabel+Copyable', '~> 2.0'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is also supported

Once you have your Swift package set up, adding UILabel+Copyable as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/alexandreos/UILabel-Copyable.git", .upToNextMajor(from: "2.0"))
]
```

### Old-fashioned way

- Add `UILabel+Copyable.swift` to your project.

# Usage

Just import the module: `import UILabel_Copyable` and then set the `isCopyingEnabled` property to `true`:

Swift:
```swift
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
label.isCopyingEnabled = true
view.addSubview(label)
```
Objective-C:
```objective-c
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
label.isCopyingEnabled = YES;
[self.view addSubview:label];
```

The same thing can be done with IBOutlet UILabel:

Swift:
```swift
import UILabel_Copyable

@IBOutlet weak var label: UILabel?

// ...
label?.isCopyingEnabled = true
```

Included is a demo project showing how to use it from a storyboard.

![UILabel+Copyable](https://raw.githubusercontent.com/alexandreos/UILabel-Copyable/screenshots/screenshot.png)

# Change log
Please see  [CHANGELOG](CHANGELOG.md) 

# License

UILabel+Copyable is licensed under the terms of the MIT License. Please see the [LICENSE](LICENSE.md) file for full details.
