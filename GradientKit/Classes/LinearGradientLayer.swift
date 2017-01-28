//
//  LinearGradientLayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/27/17.
//
//

import Foundation
import QuartzCore

public class LinearGradientLayer: GradientLayer {
    
    public enum Direction {
        case horizontal
        case vertical
        case diagonal(Bool)
        case angle(Double)
        case custom(CGPoint, CGPoint)
    }

    public var direction: Direction = .vertical
    
    public convenience init(colors: [UIColor] = Colors.randomPair(), direction: Direction = .vertical, locations: [CGFloat]? = nil) {
        self.init()
        
        self.locations = locations
        self.colors = colors
        self.direction = direction
    }

    override public func draw(in ctx: CGContext) {
        ctx.saveGState()
        
        let (startPoint, endPoint) = startAndEndPoints(direction: direction)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let options: CGGradientDrawingOptions = [.drawsAfterEndLocation]
        
        if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors.map({ $0.cgColor }) as CFArray, locations: locations) {
            ctx.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: options)
        } else {
            print("unable to create Gradient")
        }
    }
    
    func startAndEndPoints(direction: Direction) -> (CGPoint, CGPoint) {
        let size = bounds.size
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x: size.width, y: size.height)
        
        switch direction {
        case .horizontal:
            endPoint = CGPoint(x: size.width, y: 0)
        case .vertical:
            endPoint = CGPoint(x: 0, y: size.height)
        case .diagonal(let isForward):
            if isForward {
                endPoint = CGPoint(x: size.width, y: size.height)
            } else {
                startPoint = CGPoint(x: 0, y: size.height)
                endPoint = CGPoint(x: size.width, y: 0)
            }
        case .custom(let start, let end):
            startPoint = start
            endPoint = end
        case .angle(let degrees):
            endPoint = CGPoint(x: size.height * CGFloat(tan(degrees * M_PI / 180.0)), y: size.height)
        }
        
        return (startPoint, endPoint)
    }
}
