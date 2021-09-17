//
//  String+MathHelpers.swift
//  Kabbalah
//
//  Created by Dylan Elliott on 18/9/21.
//

import Foundation

let brackettedDigitRegex = try! NSRegularExpression(pattern: "\\((\\d+)\\)", options: NSRegularExpression.Options.caseInsensitive)

extension String {
    var openBrackets: Int {
        return countInstances(of: "(") - countInstances(of: ")")
    }
    
    func closeOpenBrackets() -> String {
        return self + String(repeating: ")", count: openBrackets)
    }
    
    func simplify() -> String {
        let range = NSMakeRange(0, self.count)
        return brackettedDigitRegex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1")
    }
}
