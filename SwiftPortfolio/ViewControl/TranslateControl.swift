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
    
    // Store words as tokens to be translated
    struct wordStruct {
        var token = (word: "", reversed: "", pigged: "", shorted: "")

        init(textIn: String) {
            self.token.word = textIn
            self.token.reversed = revstr( inText: textIn )
            // self.token.pigged = pigstr(textIn)
            self.token.pigged = textIn
            // self.token.shorted = shortstr(textIn)
            self.token.shorted = textIn
       }
    }
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Translate action
    @IBAction func translateIt(_ sender: Any) {
        // Input phrase
        translate(phrase: textIn.text! )
    }
    
    // Translate function
    func translate( phrase: String ) {

        // Tokenize phrase to words
        let whiteSpace = " "
        let phraseArray : [String] = phrase.components(separatedBy: whiteSpace)
        let wordCnt = phraseArray.count
        
        // Translate each word in phrase
        var i = 0
        while (i < wordCnt) {
            // Translate
            let word = wordStruct(textIn: phraseArray[i] )
            
            // Set: Initial word and each ConCat word
            if (i == 0)
            {
                revOut.text =  word.token.reversed
                pigOut.text =  word.token.pigged
                shortOut.text =  word.token.shorted
            } else {
                revOut.text =  revOut.text! + whiteSpace + word.token.reversed
                pigOut.text =  pigOut.text! + whiteSpace + word.token.pigged
                shortOut.text =  shortOut.text! + whiteSpace + word.token.shorted
            }
            
            i += 1
        }

    }
}

