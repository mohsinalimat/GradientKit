//
//  AnimatedLinearGradientLayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/29/17.
//
//

import Foundation

public extension CAGradientLayer {

    public func animateLocation(from: [Double], to: [Double], duration: Double = 3.0) {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        add(animation, forKey: "locations")
    }
    
    public func animateColors(from: [UIColor], to: [UIColor], duration: Double = 3.0) {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = from.map({ $0.cgColor })
        animation.toValue = to.map({ $0.cgColor })
        animation.duration = duration
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        add(animation, forKey: "colors")
    }
}

public extension GradientLayer {

    public func rotate(duration: Double = 3.0) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = 2 * M_PI
        animation.duration = duration
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        add(animation, forKey: "Spin")
    }
}
