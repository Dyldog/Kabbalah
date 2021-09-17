//
//  Constants.swift
//  Kabbalah
//
//  Created by Dylan Elliott on 18/9/21.
//

import Foundation

let baseOperators = [
    "+",
    "-",
    "*",
    "/"
]

func operators(openBrackets: Int) -> [String] {
    // +(, -(, *(, /(
    let openBracketStrings = baseOperators.map { $0 + "(" }
    
    // +, -, *, /, +(, -(, *(, /(
    var operators = baseOperators + openBracketStrings
    
    if openBrackets > 0 {
        operators += (baseOperators + openBracketStrings).flatMap { oper in
            (0..<openBrackets)
                // ), )), )))
                .map { idx in String(repeating: ")", count: idx) }
                // )))+, )))-
                .map { $0 + oper }
        }
    }
    
    let splitString = String(repeating: ")", count: openBrackets) + "&"
    operators += [splitString, splitString + "("]
    
    return operators
    
    
}
