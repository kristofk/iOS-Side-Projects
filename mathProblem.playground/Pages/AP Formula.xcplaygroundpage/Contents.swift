import Darwin
// AP

// apFormula: An; A1; n; d
// -> An = A1 + (n - 1) * d
// A1 = An - (n - 1)d
// n = (An - A1) / d + 1
// d = (A1 - An) / (n - 1)

// Formula2: Sn, A1, n, d
// -> Sn = (2 * A1 + (n - 1) * d) / 2 * n
// A1 = ((2 * Sn) / n - (n - 1) * d) / 2
// n = (((2 * A1) - d) + sqrt(pow(((2 * A1) - d), 2) - 4 * -d * 2 * Sn)) / (2 * -d)
// n = (((2 * A1) - d) - sqrt(pow(((2 * A1) - d), 2) - 4 * -d * 2 * Sn)) / (2 * -d)
// d = ((2 * Sn) / n - 2 * A1) / (n - 1)

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

// Sn = 2570, An = 157, A1 = 100, n = 20, d = 3
apFormula(sn: nil, an: 157, a1: 100, n: 20, d: 3)
apFormula(sn: nil, an: nil, a1: 100, n: 20, d: 3)
apFormula(sn: nil, an: 157, a1: nil, n: 20, d: 3)
apFormula(sn: nil, an: 157, a1: 100, n: nil, d: 3)
apFormula(sn: nil, an: 157, a1: 100, n: 20, d: nil)

apFormula(sn: 2570, an: nil, a1: 100, n: 20, d: 3)
apFormula(sn: nil, an: nil, a1: 100, n: 20, d: 3)
apFormula(sn: 2570, an: nil, a1: nil, n: 20, d: 3)
apFormula(sn: 2570, an: nil, a1: 100, n: nil, d: 3)
apFormula(sn: 2570, an: nil, a1: 100, n: 20, d: nil)

apFormula(sn: 2570, an: 157, a1: nil, n: 20, d: 3)
apFormula(sn: nil, an: 157, a1: nil, n: 20, d: 3)
apFormula(sn: 2570, an: nil, a1: nil, n: 20, d: 3)
apFormula(sn: 2570, an: 157, a1: nil, n: nil, d: 3)
apFormula(sn: 2570, an: 157, a1: nil, n: 20, d: nil)

apFormula(sn: nil, an: 510, a1: 200, n: nil, d: 2)

/*
func formula2(sn: Double?, a1: Double?, n: Double?, d: Double?) -> Double? {
     // Sn
    if let a1 = a1, let n = n, let d = d {
        let result = (2 * a1 + (n - 1) * d) / 2 * n
        return result
    }
    
    // A1
    if let sn = sn, let n = n, let d = d {
        let result = ((2 * sn) / n - (n - 1) * d) / 2
        return result
    }
    
    // n
    if let sn = sn, let a1 = a1, let d = d {
        var result = (((2 * a1) - d) + sqrt(pow(((2 * a1) - d), 2) - 4 * -d * 2 * sn)) / (2 * -d)
        if result > 0 {
            return result
        } else {
            result = (((2 * a1) - d) - sqrt(pow(((2 * a1) - d), 2) - 4 * -d * 2 * sn)) / (2 * -d)
            return result
        }
    }
    
    // d
    if let sn = sn, let a1 = a1, let n = n {
        let result = ((2 * sn) / n - 2 * a1) / (n - 1)
        return result
    }
    
    return nil
}
 
 */

// Sn = 2570, A1 = 100, n = 20, d = 3
//formula2(sn: nil, a1: 100, n: 20, d: 3)
//formula2(sn: 2570, a1: nil, n: 20, d: 3)
//formula2(sn: 2570, a1: 100, n: nil, d: 3)
//formula2(sn: 2570, a1: 100, n: 20, d: nil)


















