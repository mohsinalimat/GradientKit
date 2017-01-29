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

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.borderColor = UIColor.angleGradient(withColors: Colors.randomColors(numberOfColors: 5), frame: button.bounds).cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 2
        button.isHidden = true
        
        
        let layer  = AngleGradientLayer()
        layer.colors = Colors.randomColors(numberOfColors: 5)
        
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        let diameter = max(width, height) + 100
        let frame = CGRect(x: -55 - (height - width) / 2, y: -50, width: diameter, height: diameter)
        layer.frame = frame
        
        layer.rotate()
        view.layer.addSublayer(layer)
        
        
    }
}

