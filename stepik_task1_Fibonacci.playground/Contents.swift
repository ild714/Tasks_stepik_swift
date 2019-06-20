import UIKit

enum FibonachiError : Error{
    case argumentShouldNotBeNegative
}

func fibonachi (n: Int) throws -> Int {
    guard n>=0 else {throw FibonachiError.argumentShouldNotBeNegative}

    var first = 0
    var next = 1

    for _ in 0..<n {
        next = first + next
        first = next - first
}
return first
}

try fibonachi(n: -1)
