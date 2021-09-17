//
//  Evaluate.swift
//  Kabbalah
//
//  Created by Dylan Elliott on 18/9/21.
//

import Foundation

extension Double {
    /// Removes trailing zeroes
    var trimmedString: String {
        return String(format: "%g", self)
    }
}

/// Evaluates a single math expression and returns the result
/// - Parameter expression: A math expression, e.g: 1+2
/// - Returns: The result
func evaluateSingle(_ expression: String) -> Double {
    let exp: NSExpression = NSExpression(format: expression)
    let val = exp.expressionValue(with:nil, context: nil) as! Double // 2
    return val
}

/// Evaluates the expressions within the string and joins the outputs
/// - Parameter expression: Multiple math expressions joined by ampersands, e.g: 1+2&3+4
/// - Returns: The value of the expressions joined together, e.g: 37 (from the above example)
func evaluate(_ expression: String) -> String {
    let expressions = expression.components(separatedBy: "&")
    let intValues: [String] = expressions.map {
        return evaluateSingle($0).trimmedString
    }
    
    return intValues.joined()
}
