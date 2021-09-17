//
//  main.swift
//  Kabbalah
//
//  Created by Dylan Elliott on 17/9/21.
//

import Foundation

let str: String = "354562187"
let chars: [String] = str.map { String($0) }
let targets = ["123", "321"]

var count: Int = 0
var found: [String] = []

makeMathStrings(targets: targets, digits: chars.map { Int($0)! }, current: "", found: {
    let value = evaluate($0)
    let isMatch = targets.contains(value) && (found.contains($0) == false)
    
    if isMatch {
        found.append($0)
        print("\(count): \($0) == \(value)")
    }
    
    count += 1
})

print("Done")
