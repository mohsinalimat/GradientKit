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

        
        let colors = [UIColor.red, UIColor.green, UIColor.yellow, UIColor.blue, UIColor.purple,  UIColor.red]

        let layer = AngleGradientLayer()
        layer.colors = colors
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }
}

