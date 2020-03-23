//
//  ViewController.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/9/20.
//  Copyright © 2020 JM. All rights reserved.
//

import UIKit

class ReverseController: UIViewController {
    
    @IBOutlet var textIn: UITextField!
    
    @IBOutlet var revOut1: UILabel!
    @IBOutlet var revOut2: UILabel!
    @IBOutlet var revOut3: UILabel!
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func reverseIt(_ sender: Any) {
        revOut1.text = revStringNew( inText: textIn.text! )
        revOut2.text = revStringSwap( inText: textIn.text! )
    }
}

