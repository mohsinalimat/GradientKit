//
//  ViewController.swift
//  GradientKit
//
//  Created by Aashish Dhawan on 01/26/2017.
//  Copyright (c) 2017 Aashish Dhawan. All rights reserved.
//

import UIKit
import GradientKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        let layer1 = RadialGradientLayer(source: .center)
        layer1.colors = [UIColor.red, UIColor.red.withAlphaComponent(0.2)]
        layer1.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.layer.addSublayer(layer1)
        
        
        
    }
}

