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
    }
}

