//
//  stringAlgos.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/23/20.
//  Copyright © 2020 JM. All rights reserved.
//

import Foundation

func revStringNew( inText:String ) -> String {
    let method = "New: "
    
    var i = 1;          // loop and index control
    var revText = ""    // reverse string holder
    // Loop from last character until reaching 1st
    while ( i <= inText.count ) {
        // Uses String built in endIndex and offsetby
        revText = revText + String(inText[inText.index(inText.endIndex, offsetBy: -i)])
        i += 1
    }
    return method + revText
}

func revStringSwap( inText:String ) -> String {
    
    let method = "Swap: "
    var mutInText = inText      // mutator requires and inText is let
    
    var i = 0                   // loop and index control
    let j = inText.count / 2    // half way
    // Loop from to ends to middle
    while ( i < j ) {
        // Find index of items to swap
        let swapI = inText.index(inText.startIndex, offsetBy: i)
        let swap1 = inText[swapI]
        let swapJ = inText.index(inText.endIndex, offsetBy: -(i+1))
        let swap2 = inText[swapJ]
        
        // swap items (note: have not found index mutator)
        mutInText.remove(at:swapI)
        mutInText.insert(swap2, at: swapI)
        mutInText.remove(at:swapJ)
        mutInText.insert(swap1, at: swapJ)
        i += 1
    }
    
    return method + mutInText
}

