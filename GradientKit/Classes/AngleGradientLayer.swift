//
//  AngleGradientLayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/28/17.
//
//

import Foundation
import QuartzCore

public class AngleGradientLayer: GradientLayer {
    
    public var startPoint: CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var endPoint: CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var scale: CGFloat = 1.0
    
    override public func draw(in ctx: CGContext) {
        ctx.saveGState()
        
        ctx.setFillColor(backgroundColor ?? UIColor.clear.cgColor)
        ctx.fill(bounds)
        
        if let img = gradientImage() {
            ctx.draw(img, in: bounds)
        }
    }
    
    fileprivate func gradientImage() -> CGImage? {
        let size = bounds.size
        let width = Int(size.width * (scale ?? UIScreen.main.scale))
        let height = Int(size.height * (scale ?? UIScreen.main.scale))
        let bitsPerComponent: Int = MemoryLayout<UInt8>.size * 8
        let bytesPerPixel: Int = bitsPerComponent * 4 / 8
        let bytesPerRow = width * bytesPerPixel
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast
        
        var data = [RGBA]()
        
        for y in 0..<height {
            for x in 0..<width {
                let c = populatePixelData(point: CGPoint(x: x, y: y))
                data.append(c)
            }
        }
        
        let ctx = CGContext(data: &data, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        return ctx?.makeImage()
    }
    
    fileprivate func populatePixelData(point: CGPoint) -> RGBA {
        let width = Int(bounds.size.width)
        let height = Int(bounds.size.height)
        let g0 = startPoint ?? CGPoint(x: 0.5, y: 0.5)
        let g1 = endPoint ?? CGPoint(x: 1.0, y: 0.5)

        let t = conicalGradientStop(point, bounds.size, g0, g1)
        let locs = (locations ?? [0.0, 1.0]).map({ Float($0) }) ?? [0.0, 1.0]
    
        return interpolatedColor(t, colors, locs)
    }
    
    fileprivate func conicalGradientStop(_ point: CGPoint, _ size: CGSize, _ g0: CGPoint, _ g1: CGPoint) -> Float {
        let c = CGPoint(x: size.width * g0.x, y: size.height * g0.y)
        let s = CGPoint(x: size.width * (g1.x - g0.x), y: size.height * (g1.y - g0.y))
        let p = CGPoint(x: point.x - c.x, y: point.y - c.y)
        let q = Float(atan2(s.y, s.x))
        var a = Float(atan2(p.y, p.x)) - q
        if a < 0 {
            a += 2 * π
        }
        return  a / (2 * π)
    }
    
    fileprivate func interpolatedColor(_ t: Float, _ colors: [UIColor], _ locations: [Float]) -> RGBA {
        assert(!colors.isEmpty)
        
        var locs = locations
        if locations == nil || locations.count != colors.count {
            locs = uniformLocationsWithCount(colors.count)
        }
        
        assert(colors.count == locs.count)
        
        var p0: Float = 0; var p1: Float = 1
        var c0 = colors.first!; var c1 = colors.last!
        
        for (i, v) in locs.enumerated() {
            if v > p0 && t >= v {
                p0 = v
                c0 = colors[i]
            }
            if v < p1 && t <= v {
                p1 = v
                c1 = colors[i]
            }
        }
        
        let p: Float = p0 == p1 ? 0 : lerp(t, inRange: p0...p1, outRange: 0...1)
        
        return interpolate(color: RGBA(c0), to: RGBA(c1), fraction: p)
    }
    
    fileprivate func uniformLocationsWithCount(_ count: Int) -> [Float] {
        var locations = [Float]()
        for i in 0..<count {
            locations.append(Float(i)/Float(count-1))
        }
        return locations
    }
    
    fileprivate func interpolate(color startColor: RGBA, to endColor: RGBA, fraction: Float) -> RGBA {
        
        let r = lerp(fraction, startColor.r, endColor.r)
        let g = lerp(fraction, startColor.g, endColor.g)
        let b = lerp(fraction, startColor.b, endColor.b)
        let a = lerp(fraction, startColor.a, endColor.a)
        
        return RGBA(r: r, g: g, b: b, a: a)
    }
    
    fileprivate func lerp(_ t: Float, _ a: UInt8, _ b: UInt8) -> UInt8 {
        return UInt8(Float(a) + min(max(t, 0), 1) * (Float(b) - Float(a)))
    }
    
    fileprivate func lerp(_ value: Float, inRange: ClosedRange<Float>, outRange: ClosedRange<Float>) -> Float {
        return (value - inRange.lowerBound) * (outRange.upperBound - outRange.lowerBound) / (inRange.upperBound - inRange.lowerBound) + outRange.lowerBound
    }
}

fileprivate let π = Float(M_PI)
fileprivate typealias PixelData = [RGBA]

fileprivate struct RGBA {
    var r: UInt8
    var g: UInt8
    var b: UInt8
    var a: UInt8
    
    fileprivate init(_ color: UIColor) {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.init(r: UInt8(r * 0xff), g: UInt8(g * 0xff), b: UInt8(b * 0xff), a: UInt8(a * 0xff))
    }
    
    fileprivate init(r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}
