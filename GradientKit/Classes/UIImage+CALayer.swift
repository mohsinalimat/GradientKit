//
//  UIImage+CALayer.swift
//  Pods
//
//  Created by Aashish Dhawan on 1/29/17.
//
//

import Foundation

extension UIImage {

    static func imageWith(layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.isOpaque, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }

        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
}
