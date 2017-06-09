//
//  Funtions.swift
//  Stock Calculator
//
//  Created by Kristof Kocsis on 2017. 06. 09..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import Foundation

enum Operation{
    case addition
    case subtraction
    case multiplication
    case division
    case percent
    case empty
}

func add(to original: Double, value: Double) -> Double {
    let result = original + value
    return result
}

func subtract(from original: Double, value: Double) -> Double {
    let result = original - value
    return result
}

func multipy(base: Double, by amount: Double) -> Double {
    let result = base * amount
    return result
}

func divide(base: Double, by amunt: Double) -> Double {
    let result = base / amunt
    return result
}

