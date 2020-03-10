//
//  ViewController.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/9/20.
//  Copyright © 2020 JM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet connects to Storyboard items, I had problems with Drag
    @IBOutlet weak var side1: UITextField!
    @IBOutlet weak var side2: UITextField!
    @IBOutlet weak var side3: UILabel!
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intialize Outlets
        side1.text = "0.0"
        side2.text = "0.0"
        side3.text = "0.0"
    }

    // IBAction created with Drag from Storyboar
   @IBAction func calculate(sender: UIButton) {
        // let is for values that are not modifed
        let s1 = Float(side1.text!) // Input value, ! avoids errors
        let s2 = Float(side2.text!)

        // Pythagorean Calculation
        let s3 = sqrt( (s1! * s1!) + (s2! * s2!) )

        // Set calcuation to screen
        side3.text = String(s3)
        print("Pyth  \(side3.text!)")
    
    }
}

