//
//  stringAlgos.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/23/20.
//  Copyright © 2020 JM. All rights reserved.
//

import Foundation

// Reverse string though concat to new string
func revstrNew( inText:String ) -> String {
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

// Reverse string by swapping 1st and last, 2nd and last-1, ...
func revstrSwap( inText:String ) -> String {
    let method = "Swap: "

    var i = 0                   // loop and index control
    var mutInText = inText      // reverse string holder
    let j = mutInText.count / 2    // half way
    
    // Loop from to ends to middle
    while ( i < j ) {
        // swap characters
        swapchars(mutInText: &mutInText, i: i, j: -(i+1))
        i += 1
    }
    return method + mutInText
}

// Reverse string by swapping 1st and last, 2nd and last-1, ...
func revstrBuiltIn( inText:String ) -> String {
    let method = "Built in: "

    return method + String(inText.reversed())
}

// Swap characters, mutate String positions i & j
func swapchars( mutInText: inout String, i:Int, j:Int ) {
    // find characters
    let swapI = mutInText.index(mutInText.startIndex, offsetBy: i)
    let swap1 = mutInText[swapI]
    let swapJ = mutInText.index(mutInText.endIndex, offsetBy: j)
    let swap2 = mutInText[swapJ]
    
    // swap items (note: have not found index mutator)
    mutInText.remove(at:swapI)
    mutInText.insert(swap2, at:swapI)
    mutInText.remove(at:swapJ)
    mutInText.insert(swap1, at:swapJ)
}
