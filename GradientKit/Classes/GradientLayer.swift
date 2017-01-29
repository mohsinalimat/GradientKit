//
//  GradientLayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/27/17.
//
//

import Foundation

public enum GradientType {
    case linear, radial, angle
}

public class GradientLayer: CALayer {

    public var locations: [CGFloat]? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var colors: [UIColor] = Colors.randomPair() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    required override public init() {
        super.init()
        
        needsDisplayOnBoundsChange = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override public init(layer: Any) {
        super.init(layer: layer)
    }
    
    public convenience init(colors: [UIColor], locations: [CGFloat]?) {
        self.init()

        self.colors = colors
        self.locations = locations
    }
}
