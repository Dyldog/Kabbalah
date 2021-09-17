//
//  MakeMathStrings.swift
//  Kabbalah
//
//  Created by Dylan Elliott on 18/9/21.
//

import Foundation

private func completedDigitsMatchTarget(expression: String, target: String) -> Bool {
    let subExpressions = expression.components(separatedBy: "&").dropLast().joined(separator: "&")
    guard subExpressions.isEmpty == false else { return true }
    return target.hasPrefix(evaluate(subExpressions))
}

private func completedDigitsMatchTargets(expression: String, targets: [String]) -> Bool {
    return targets.first(where: { completedDigitsMatchTarget(expression: expression, target: $0) }) != nil
}

func makeMathStrings(targets: [String], digits: [Int], current: String, found: (String) -> Void) {
    var newDigits = digits
    let first = newDigits.removeFirst()
    
    if newDigits.isEmpty {
        found("\(current)\(first)".closeOpenBrackets().simplify())
    } else {
        let newStrings = operators(openBrackets: current.openBrackets).map {
            "\(current)\(first)\($0)"
        }.filter { completedDigitsMatchTargets(expression: $0, targets: targets)}
        
        Array(Set(newStrings)).forEach { makeMathStrings(targets: targets, digits: newDigits, current: $0, found: found) }
    }
    
}
