import UIKit

extension Array {
    mutating func myShuffle(){
        var tempArray = self
        for i in 0..<self.count{
            let randomNum = Int.random(in: 0..<tempArray.count)
            self[i] = tempArray[randomNum]
            tempArray.remove(at: randomNum)
        }
    }
}

func calcLetters(str: String) -> [String: Int]{
    var dictionary = [String: Int]()
    str.forEach { (char) in
        guard let num = dictionary[String(char)]  else { return dictionary[String(char)] = 1 }
        dictionary[String(char)] = num + 1
    }
    return dictionary
}

print (calcLetters(str: "privettt"))

/*
var mas: [Int] = [1,2,3,4]
mas.myShuffle()
for i in 0..<mas.count{
    print (mas[i])
}
*/
