# GradientKit

[![CI Status](http://img.shields.io/travis/Aashish Dhawan/GradientKit.svg?style=flat)](https://travis-ci.org/Aashish Dhawan/GradientKit)
[![Version](https://img.shields.io/cocoapods/v/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)
[![License](https://img.shields.io/cocoapods/l/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)
[![Platform](https://img.shields.io/cocoapods/p/GradientKit.svg?style=flat)](http://cocoapods.org/pods/GradientKit)

Gradient Kit makes super easy to create gradient layers. It supports Linear, radial and angle gradients.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### 1. Creating Linear gradients

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
<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/linear.png" alt="Linear" align="center" />

### 2. Creating Radial gradients

```swift

// Creating radial gradient from center
let layer1 = RadialGradientLayer()
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating radial gradient from topleft
let layer1 = RadialGradientLayer(source: .topLeft)
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating radial gradient from top
let layer1 = RadialGradientLayer(source: .top)
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating radial gradient from left
let layer1 = RadialGradientLayer(source: .left)
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

// Creating radial gradient with alpha components
let layer1 = RadialGradientLayer()
layer1.colors = [.red, .red.withAlphaComponent(0.2)]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)
```
<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/radial.png" alt="Linear" align="center" />

### 3. Creating Angle gradients

```swift

// Angle gradient
let layer1 = AngleGradientLayer()
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

//Angle gradient with custom start and end points
let layer1 = AngleGradientLayer()
layer1.startPoint = CGPoint(x: 0, y: 0)
layer1.endPoint = CGPoint(x: 1, y: 1)
layer1.colors = [.red, .green, .blue, .magenta, .red]
layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
view.layer.addSublayer(layer1)

Note: Angle gradients are computation heavy and should be used on small views.

```
<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/angle.png" alt="angle" align="center" />

### 4. Setting as background color

``` swift
// Setting Linear gradient as background
self.view.backgroundColor = UIColor.gradient(type: .linear, frame: view.bounds)

// setting radial gradient as background
self.view.backgroundColor = UIColor.gradient(type: .radial, frame: view.bounds)

// set angle gradient as background
let colors = Colors.randomColors(numberOfColors: 5)
self.view.backgroundColor = UIColor.angleGradient(withColors: colors, frame: view.bounds)

// set your custom layer as background
let linearGradient = LinearGradientLayer()
linearGradient.frame = view.frame
self.view.backgroundColor = UIColor.gradient(withLayer: linearGradient)

```
### 5. Using as backgroundColor and borderColor

<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/text.png" alt="angle" align="center" />
<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/button.png" alt="angle" align="center" />

### 6. More fun with simple animations

``` swift
// animation 1
let view = UIView()
view.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
view.layer.cornerRadius = 100
view.clipsToBounds = true

let layer = AngleGradientLayer()
layer.colors = Colors.randomColors(numberOfColors: 5)
layer.frame = view.bounds
layer.rotate()
view.layer.addSublayer(layer)

self.view.addSubview(view)

// animation 2

let colors1 = Colors.randomPair()
let colors2 = Colors.randomPair()
let layer = CAGradientLayer()
layer.colors = colors1
layer.startPoint = CGPoint(x:0, y: 0)
layer.endPoint = CGPoint(x:1, y: 1)
layer.animateColors(from: colors1, to: colors2, duration: 3)
layer.frame = view.bounds
view.layer.addSublayer(layer)
```

<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/anim1.gif" alt="angle" align="center" />
<img src="https://raw.githubusercontent.com/aashishdhawan/GradientKit/master/Images/anim2.gif" alt="angle" align="center" />

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
