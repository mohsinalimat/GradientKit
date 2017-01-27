//
//  RadialGradientLayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/27/17.
//
//

import Foundation

public class RadialGradientLayer: GradientLayer {
    
    public enum Source {
        case center, left, right, top, bottom, topLeft, topRight, bottomLeft, bottomRight
        case custom(CGFloat, CGFloat, CGPoint, CGPoint)
    }

    public var source: Source = .center
    
    public convenience init(colors: [UIColor] = Colors.randomPair(), source: Source = .center, locations: [CGFloat] = [0.0, 1.0]) {
        self.init()
        
        self.locations = locations
        self.colors = colors
        self.source = source
    }
    
    override public func draw(in ctx: CGContext) {
        ctx.saveGState()
        
        let options: CGGradientDrawingOptions = [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let (startCenter, endCenter, startRadius, endRadius) = centersAndRadius(source: source)
        if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors.map({ $0.cgColor }) as CFArray, locations: locations) {
            ctx.drawRadialGradient(gradient, startCenter: startCenter, startRadius: startRadius, endCenter: endCenter, endRadius: endRadius, options: options)
        } else {
            print("unable to create Gradient")
        }
    }
    
    func centersAndRadius(source: Source) -> (CGPoint, CGPoint, CGFloat, CGFloat) {
        let size = bounds.size
        
        var startRadius: CGFloat = 0.0
        var endRadius = max(size.width, size.height) / 2
        var startCenter = CGPoint.zero
        var endCenter = CGPoint.zero
    
        switch source {
        case .center:
            startRadius = 0
            endRadius = max(size.width, size.height) / 2
            startCenter = CGPoint(x: bounds.midX, y: bounds.midY)
            endCenter = startCenter
        case .left:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: 0, y: bounds.midY)
            endCenter = startCenter
        case .right:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: size.width, y: bounds.midY)
            endCenter = startCenter
        case .top:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: bounds.midX, y: 0)
            endCenter = startCenter
        case .bottom:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: bounds.midX, y: size.height)
            endCenter = startCenter
        case .topLeft:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: 0, y: 0)
            endCenter = startCenter
        case .topRight:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: size.width, y: 0)
            endCenter = startCenter
        case .bottomLeft:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: 0, y: size.height)
            endCenter = startCenter
        case .bottomRight:
            startRadius = 0
            endRadius = min(size.width, size.height)
            startCenter = CGPoint(x: size.width, y: size.height)
            endCenter = startCenter
        case .custom(let _startRadius, let _endRadius, let _startCenter, let _endCenter):
            startRadius = _startRadius
            endRadius = _endRadius
            startCenter = _startCenter
            endCenter = _endCenter
        }
        
        return (startCenter, endCenter, startRadius, endRadius)
    }
}
