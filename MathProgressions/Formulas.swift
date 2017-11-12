//
//  Formulas.swift
//  MathProgressions
//
//  Created by Kristof Kocsis on 2017. 11. 04..
//  Copyright © 2017. kristofk. All rights reserved.
//

import Foundation

func apFormula(sn: Double?, an: Double?, a1: Double?, n: Double?, d: Double?) -> (Double, Double, Double, Double, Double)? {
    
    var sn = sn
    var an = an
    var a1 = a1
    var n = n
    var d = d
    
    for _ in 0...6 {
        // Sn
        if let a1 = a1, let n = n, let d = d {
            let result = (2 * a1 + (n - 1) * d) / 2 * n
            sn = result
        }
        
        // An
        if let a1 = a1, let n = n, let d = d {
            let result = a1 + (n - 1) * d
            an = result
        }
        
        // A1
        if let an = an, let n = n, let d = d {
            let result = an - (n - 1)*d
            a1 = result
        } else if let sn = sn, let n = n, let d = d {
            let result = ((2 * sn) / n - (n - 1) * d) / 2
            a1 = result
        }
        
        // n
        if let an = an, let a1 = a1, let d = d {
            let result = (an - a1) / d + 1
            n = result
        } else if let sn = sn, let a1 = a1, let d = d {
            var result = (((2 * a1) - d) + sqrt(pow(((2 * a1) - d), 2) - 4 * -d * 2 * sn)) / (2 * -d)
            if result > 0 {
                n = result
            } else {
                result = (((2 * a1) - d) - sqrt(pow(((2 * a1) - d), 2) - 4 * -d * 2 * sn)) / (2 * -d)
                n = result
            }
        }
        
        // d
        if let an = an, let a1 = a1, let n = n {
            let result = -((a1 - an) / (n - 1))
            d = result
        } else if let sn = sn, let a1 = a1, let n = n {
            let result = ((2 * sn) / n - 2 * a1) / (n - 1)
            d = result
        }
    }
    
    guard let snSol = sn, let anSol = an, let a1Sol = a1, let nSol = n, let dSol = d else {
        return nil
    }
    
    print("Sn = \(snSol)\nAn = \(anSol)\nA1 = \(a1Sol)\n n = \(nSol)\n d = \(dSol)\n")
    return (snSol, anSol, a1Sol, nSol, dSol)
}


func gpFormula(sn: Double?, an: Double?, a1: Double?, q: Double?, n: Double?) -> (Double, Double, Double, Double, Double)? {
    
    var sn = sn
    var an = an
    var a1 = a1
    var q = q
    var n = n
    
    for _ in 0...6 {
        // Sn, An
        if let a1 = a1, let q = q, let n = n {
            sn = a1*(pow(q, n) - 1) / (q - 1)
            an = a1*pow(q, n - 1)
        }
        
        // A1
        if let an = an, let q = q, let n = n {
            a1 = an / pow(q, n - 1)
        } else if let sn = sn, let q = q, let n = n {
            a1 = sn / ((pow(q, n) - 1) / (q - 1))
        }
        
        // q
        if let an = an, let a1 = a1, let n = n {
            q = pow(an / a1, 1 / (n - 1))
        }
        
        // n
        if let an = an, let a1 = a1, let q = q {
            n = log(an / a1) / log(q) + 1
        } else if let sn = sn, let a1 = a1, let q = q {
            n = log(sn / a1 / (q - 1) + 1) / log(q)
        }
    }
    
    guard let snSol = sn, let anSol = an, let a1Sol = a1, let qSol = q, let nSol = n else {
        return nil
    }
    
    print("Sn = \(snSol)\nAn = \(anSol)\nA1 = \(a1Sol)\n q = \(qSol)\n n = \(nSol)\n")
    return (snSol, anSol, a1Sol, qSol, nSol)
}
