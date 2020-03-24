//
//  ViewController.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/9/20.
//  Copyright © 2020 JM. All rights reserved.
//

import UIKit

class TranslateController: UIViewController {
    
    @IBOutlet var textIn: UITextField!
    
    @IBOutlet var revOut: UILabel!
    @IBOutlet var pigOut: UILabel!
    @IBOutlet var shortOut: UILabel!
    
    struct wordStruct {
        var token = (word: "", reversed: "", pigged: "", shorted: "")

        init(textIn: String) {
            self.token.word = textIn
            self.token.reversed = revstrBuiltIn( inText: textIn )
            self.token.pigged = textIn
            self.token.shorted = textIn
       }
    }
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func translateIt(_ sender: Any) {
        let word = wordStruct(textIn: textIn.text! )

        revOut.text =  word.token.reversed
        pigOut.text =  word.token.pigged
        shortOut.text =  word.token.shorted
    }
}

