//
//  TranslateControl.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/9/20.
//  Copyright © 2020 JM. All rights reserved.
//

import UIKit

class TranslateController: UIViewController {
    
    // Input phrase from storyboard
    @IBOutlet var textIn: UITextField!
    // Output labels from storyboard
    @IBOutlet var revOut: UILabel!
    @IBOutlet var pigOut: UILabel!
    @IBOutlet var shortOut: UILabel!
    
    // Loads at initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
     * Translate action received from storyboard
     *   call made to translate function
     */
    @IBAction func translateIt(_ sender: Any) {
        // Input phrase
        translate(phrase: textIn.text! )
    }
    
    /*
     * Structure to store a word and build associated translated words
     * word: intial word
     * reversed: reverse order of characters in inital word
     * pigged: piglatin translation of initial word
     * storted: shorthand notation of initial word
     */
    struct tokenStruct {
        var token = (word: "", reversed: "", pigged: "", shorted: "")

        init(textIn: String) {
            self.token.word = textIn
            self.token.reversed = revstr( inText: textIn )
            self.token.pigged = pigstr(inText: textIn)
            self.token.shorted = shortstr(inText: textIn)
       }
    }
    
    /*
     * Translate control method/function:
     * 1. phrase to tokens
     * 2. iterate through tokens
     * 3. build translation instance of each token
     * 4. set translation to associated label
     */
    func translate( phrase: String ) {

        // Tokenize phrase to words
        let whiteSpace = " "
        let phraseArray : [String] = phrase.components(separatedBy: whiteSpace)
        let wordCnt = phraseArray.count
        
        // Translate each word in phrase
        var i = 0
        while (i < wordCnt) {
            // Translate
            let ts = tokenStruct(textIn: phraseArray[i] )
            // Set
            setLabels(ts: ts, sep: whiteSpace, i: i)
            
            i += 1
        }

    }
    
    /* Translate setter
     * 1. If initial set tokens to text label
     * 2. Else concatenate tokens to text label
     */
    func setLabels( ts: tokenStruct, sep: String, i: Int ) {
        // Set: Initial word and each ConCat word
        if (i == 0)
        {
            revOut.text =  ts.token.reversed
            pigOut.text =  ts.token.pigged
            shortOut.text =  ts.token.shorted
        } else {
            revOut.text =  revOut.text! + sep + ts.token.reversed
            pigOut.text =  pigOut.text! + sep + ts.token.pigged
            shortOut.text =  shortOut.text! + sep + ts.token.shorted
        }
    }

}

