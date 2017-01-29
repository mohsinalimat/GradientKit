//
//  Color+Gradient.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/29/17.
//
//

import Foundation

public extension UIColor {

    public static func gradient(withColors colors: [UIColor], type: GradientType, frame: CGRect) -> UIColor {
        var layer: GradientLayer
        
        switch type {
        case .linear:
            layer = LinearGradientLayer(colors: colors)
        case .radial:
            layer = RadialGradientLayer(colors: colors)
        case .angle:
            layer = AngleGradientLayer(colors: colors)
        }
        
        layer.frame = frame

        return gradient(withLayer: layer)
    }
    
    public static func gradient(type: GradientType, frame: CGRect) -> UIColor {
        let colors: [UIColor]
        
        switch type {
        case .linear: fallthrough
        case .radial:
            colors = Colors.randomPair()
        case .angle:
            colors = [.red, .green, .blue, .yellow, .cyan, .magenta, .orange, purple, .red]
        }
        
        return gradient(withColors: colors, type: type, frame: frame)
    }
    
    public static func gradient(withLayer layer: GradientLayer) -> UIColor {
        let image = UIImage.imageWith(layer: layer)
        
        return UIColor(patternImage: image)
    }
    
    public static func angleGradient(withColors colors: [UIColor], frame: CGRect) -> UIColor {
        return gradient(withColors: colors, type: .angle, frame: frame)
    }
}
