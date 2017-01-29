# GradientKit

[![CI Status](http://img.shields.io/travis/Aashish Dhawan/GradientKit.svg?style=flat)](https://travis-ci.org/Aashish Dhawan/GradientKit)
[![Version](https://img.shields.io/cocoapods/v/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)
[![License](https://img.shields.io/cocoapods/l/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)
[![Platform](https://img.shields.io/cocoapods/p/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)

Gradient Kit makes super easy to create gradient layers. It supports Linear, radial and angle gradients. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

1. Creating Linear gradients 

```swift

// Creating vertical gradient with random colors 
let layer1 = LinearGradientLayer()
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating vertical gradient with custom colors 
let layer1 = LinearGradientLayer(direction: .vertical)
layer1.colors = [.red, .orange, .yellow]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating horizontal gradient with custom colors 
let layer1 = LinearGradientLayer(direction: .horizontal)
layer1.colors = [.red, .orange, .yellow]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating diagonal gradient with custom colors 
let layer1 = LinearGradientLayer(direction: .diagonal(true))
layer1.colors = [.red, .orange, .yellow]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating diagonal gradient with custom angle
let layer1 = LinearGradientLayer(direction: .angle(45))
layer1.colors = [.red, .orange, .yellow]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)
```

## Requirements

## Installation

GradientKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GradientKit"
```

## Author

Aashish Dhawan, aashishdhawan@gmail.com
Twitter: - [@aashish_dhawan](https://twitter.com/aashish_dhawan)

## Credits 

The idea for Angle gradient was shamelessly stolen from [MKGradientView](https://github.com/maxkonovalov/MKGradientView) and i am thankful to [@maxkonovalov](https://github.com/maxkonovalov) for his contribution.
## License

GradientKit is available under the MIT license. See the LICENSE file for more info.
