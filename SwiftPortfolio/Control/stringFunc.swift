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
        revText = revText + String( inText[inText.index(inText.endIndex, offsetBy: -i)] )
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

// Reverse string using built-in
func revstrBuiltIn( inText:String ) -> String {
    let method = "Built in: "

    return method + revstr(inText: inText)
}

// Reverse string
func revstr( inText:String ) -> String {

    return String(inText.reversed())
}

// Piglatin string builder
func pigstr( inText:String ) -> String {
    var mutInText = inText      // piglatin string holder
    
    var count = 0;
    while (count >= 0 && count < inText.count )
    {
        let front = mutInText.index(mutInText.startIndex, offsetBy: 0)
        let back = mutInText.index(mutInText.endIndex, offsetBy: -1)
        let frontChar = mutInText[front]
        
        let charType = (i: count, c: frontChar.lowercased())
        switch charType {
        
        // leading vowel, ad "ya" to end
        case (let i, let c) where (i == 0) && ( isvowel(c: c) ) :
            mutInText = mutInText + "ya"
            count = -1;
            break
            
        // vowel or y after first character, add "ay" to end
        case ( _, let c) where ( isvowel(c: c) || c == "y") :
            mutInText = mutInText + "ay"
            count = -1;
            break
            
        // leading consonant, move front character to back, this can repeat until vowel condition met
         default : /* done */
            mutInText.remove(at:front)
            mutInText.insert(frontChar, at:back)
            count += 1
            break
        }
    }
    return mutInText
}

// Shorthand string builder
func shortstr( inText:String ) -> String {
    
    // special words
    let lc = inText.lowercased()
    if (lc == "for") {
        return "4"
    } else if (lc == "to" || lc == "too" || lc == "two") {
        return "2"
    } else if (lc == "you" ) {
        return "U"
    }
    
    // shorthand mutatations
    var mutInText = inText      // shorthand string holder
    var count = 0;
    while ( count < mutInText.count )
    {
        // character setup
        let current = mutInText.index(mutInText.startIndex, offsetBy: count)
        let frontChar = mutInText[current]
        
        // conditions of shorthand
        let charType = (i: count, c: frontChar.lowercased())
        switch charType {
        
        //  vowel, remove it
        case (_, let c) where ( isvowel(c: c) ) :
            mutInText.remove(at:current)
            count += 1
            break
            
         // consonant, do nothing
         default : /* done */
            count += 1
            break
        }
    }
    
    return mutInText
}
 
// Vowel tester
func isvowel(c: String) -> Bool
{
    return (c == "a" || c == "e" || c == "i" || c == "o" || c == "u" )
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
