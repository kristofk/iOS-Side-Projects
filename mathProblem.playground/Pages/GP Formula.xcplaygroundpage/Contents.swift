import Darwin
import Foundation
// GP Formula

pow(16, Double(1)/Double(4))
//print("\(log(Double(16)) / log(Double(2)))")

// Formula1: An, A1, q, n
// -> An = A1 * pow(q, n - 1)
// A1 = An / pow(q, n - 1)
// q = pow(An / A1, 1 / (n - 1))
// n = log(An / A1) / log(q) + 1

// Formula2: Sn, A1, q, n
// -> Sn = A1 * (pow(q, n) - 1) / (q - 1)
// A1 = Sn / ((pow(q, n) - 1) / (q - 1))
// q = ?
// n = log(Sn / A1 / (q - 1) + 1) / log(q)

// Sn: A1, q, n
// An: A1, q, n
// A1: An, q, n || Sn, q, n
// q: An, A1, n ||
// n: An, A1, q || Sn, A1, q

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


// Sn = 310, An = 160, A1 = 10, q = 2, n = 5
gpFormula(sn: nil, an: 160, a1: 10, q: 2, n: 5)
gpFormula(sn: nil, an: nil, a1: 10, q: 2, n: 5)
gpFormula(sn: nil, an: 160, a1: nil, q: 2, n: 5)
gpFormula(sn: nil, an: 160, a1: 10, q: nil, n: 5)
gpFormula(sn: nil, an: 160, a1: 10, q: 2, n: nil)

gpFormula(sn: 310, an: nil, a1: 10, q: 2, n: 5)
gpFormula(sn: nil, an: nil, a1: 10, q: 2, n: 5)
gpFormula(sn: 310, an: nil, a1: nil, q: 2, n: 5)
gpFormula(sn: 310, an: nil, a1: 10, q: nil, n: 5)
gpFormula(sn: 310, an: nil, a1: 10, q: 2, n: nil)

gpFormula(sn: 310, an: 160, a1: nil, q: 2, n: 5)
gpFormula(sn: nil, an: 160, a1: nil, q: 2, n: 5)
gpFormula(sn: 310, an: nil, a1: nil, q: 2, n: 5)
gpFormula(sn: 310, an: 160, a1: nil, q: nil, n: 5)
gpFormula(sn: 310, an: 160, a1: nil, q: 2, n: nil)







