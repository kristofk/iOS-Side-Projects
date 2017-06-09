//
//  Buttons.swift
//  Stock Calculator
//
//  Created by Kristof Kocsis on 2017. 06. 09..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import Foundation

enum NumberType{
    case Positive
    case Negative
}
func toggleSign(number: Double) -> Double {
    var strNum = String(number)
    var numTyp: NumberType
    
    if strNum[0] == "-" {
        numTyp = .Negative
    } else {
        numTyp = .Positive
    }
    
    switch numTyp {
    case .Negative:
        strNum = strNum[1..<strNum.length+1]
    case .Positive:
        strNum = "-" + strNum
    }
    
    return Double(strNum)!
}
