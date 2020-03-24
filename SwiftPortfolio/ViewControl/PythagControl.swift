//
//  PythagControl.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/9/20.
//  Copyright © 2020 JM. All rights reserved.
//

import UIKit

class PythagController: UIViewController {
    
    // IBOutlet connects to Storyboard items, I had problems with Drag
    @IBOutlet weak var side1: UITextField!
    @IBOutlet weak var side2: UITextField!
    @IBOutlet weak var side3: UILabel!
    
    // Sides of triangle
    var triangle = (A: 0.0, B: 0.0, C: 0.0)
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intialize Outlets
        side1.text = String(triangle.A)
        side2.text = String(triangle.B)
        side3.text = String(triangle.C)
    }

    // IBAction created with Drag from Storyboar
   @IBAction func calculate(sender: UIButton) {
        // Set sides to input values
        triangle.A = Double(side1.text!)! // Input value, !(Bang) avoids errors
        triangle.B = Double(side2.text!)!

        // Pythagorean calculation
        triangle.C = sqrt( (triangle.A * triangle.A) + (triangle.B * triangle.B) )

        // Set calcuation to screen
        side3.text = String(triangle.C)
        print("Pyth  \(side3.text!)")
    
    }
}

