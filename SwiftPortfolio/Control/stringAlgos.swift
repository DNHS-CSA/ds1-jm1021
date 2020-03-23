//
//  stringAlgos.swift
//  SwiftPortfolio
//
//  Created by John Mortensen on 3/23/20.
//  Copyright © 2020 JM. All rights reserved.
//

import Foundation

func reverseStringLoop( inText:String ) -> String {
    
    let method = "Loop: "
    
    var n = 1;
    var revText = ""
    while ( n <= inText.count ) {
        revText = revText + String(inText[inText.index(inText.endIndex, offsetBy: -n)])
        n += 1
    }

    
    return method + revText
}

func reverseStringArray( inText:String ) -> String {
    
    let method = "Array: "
    
    return method + inText
}

func reverseStringRecursion( inText:String ) -> String {
    
    let method = "Recursion: "
    
    
    return method + inText
}
