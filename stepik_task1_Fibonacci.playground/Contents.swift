import UIKit

enum Errors : Error {
    case errorInNumber
}

func fibonachi(n: Int) throws -> Int {
    guard n >= 0 else {
        throw Errors.errorInNumber
    }
    
    var a1 = 1
    var a2 = 1
    var a_n = 0
    for _ in 2..<n {
        a_n = a1 + a2
        a1 = a2
        a2 = a_n
    }
    return a_n
}

try fibonachi(n: -1)
