UILabel+Copyable ![Supported Platforms](https://img.shields.io/cocoapods/p/UILabel+Copyable.svg) [![Latest pod release](https://img.shields.io/cocoapods/v/UILabel+Copyable.svg)](https://cocoapods.org/pods/UILabel+Copyable) [![Build Status](https://travis-ci.org/alexandreos/UILabel-Copyable.svg?branch=master)](https://travis-ci.org/alexandreos/UILabel-Copyable)
===
A simple UILabel category meant to add copy functionality to it.

# Features
- Supports Interface Builder
- Supports long press gesture
- Allows enable/disable the copy feature
- Works with all UILabel objects already in your project

# Installation

### CocoaPods
The easiest way of installing UILabel+Copyable is via [CocoaPods](http://cocoapods.org/). 

```ruby
pod 'UILabel+Copyable', '~> 1.0.0'
```

### Old-fashioned way

- Add `UILabel+Copyable.h` and `UILabel+Copyable.m` to your project.
- `#import "UILabel+Copyable.h"` where you want to use the control.
- These files require **ARC**.

# Usage

Just import the category header: `#import "UILabel+Copyable.h"` and then set the `copyingEnabled` property to `YES`:

```objective-c
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
label.copyingEnabled = enabled;
[self.view addSubview:label];
```

The same thing can be done with IBOutlet UILabel:

```objective-c
@property (nonatomic, weak) IBOutlet UILabel *label;

....

self.label.copyingEnabled = enabled;

```

Included is a demo project showing how to use it from a storyboard.

![UILabel+Copyable](https://raw.githubusercontent.com/alexandreos/UILabel-Copyable/screenshots/screenshot.png)

# Change log
* version 1.0.1
  * Resolved issue [#1](https://github.com/alexandreos/UILabel-Copyable/issues/1).

* version 1.0.0
  * Initial release

# License

UILabel+Copyable is licensed under the terms of the MIT License. Please see the [LICENSE](LICENSE.md) file for full details.
